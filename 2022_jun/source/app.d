import std;

alias Coord = Tuple!(int, int);

enum N = 10;
char[N][N] regionOfCell; // region of each grid cell
bool[Coord][char] coordsOfRegion; // coordinates of region
bool[Coord] emptyCoordsPossible; // for def value coordsOfRegion
int[N][N] values; // values in the grid cells
auto answer = new int[][](N,N);
bool[Coord][int][char] regionPossible; // set of possible values
bool[Coord][int] emptyRegionPossible;
bool[int][N][N] coordPossible; // possible values for each cell
bool[Coord][int][int] circlePossible; // circles from values, [coord][index][value started circle]
bool[Coord][int] emptyCirclePossible;
bool[int][char] toDelete; // delete new filled values

void valueCheck()
{
    foreach (i; 0 .. N)
        foreach (j; 0 .. N)
        {
            if (values[i][j] >= 1)
            {
                // circle rule
                for (int k = i - values[i][j]; k <= i + values[i][j]; k++)
                    for (int l = j - values[i][j]; l <= j + values[i][j]; l++)
                        if ((k >= 0) && (k < N) && (l >= 0) && (l < N)) {
                            auto trshld = abs(k - i) + abs(l - j);
                            if (trshld < values[i][j]) {
                                coordPossible[k][l].remove(values[i][j]);
                                auto tmp = regionPossible[regionOfCell[k][l]].get(values[i][j], emptyCoordsPossible);
                                if (tmp.length > 0) {
                                    regionPossible[regionOfCell[k][l]][values[i][j]].remove(Coord(k,l));
                                }
                            }
                            else if (trshld == values[i][j]) {
                                if ((values[i][j] in coordPossible[k][l]) || (values[k][l] == values[i][j]) || (answer[k][l] == values[i][j]))
                                    circlePossible[values[i][j]][10*i+j][Coord(k, l)] = true;
                            }
                        }

                // move from values to answer
                answer[i][j] = values[i][j];
                values[i][j] = 0;
            }
        }
    clearCircles();
}


void possibleCheck() {
    foreach (i; 0 .. N)
        foreach (j; 0 .. N)
            foreach (w; coordPossible[i][j].byKey()) {
                // check if it possible to have w in the cell [i,j]
                bool flag = true;
                outer: for (int k = i - w; k <= i + w; k++)
                    for (int l = j - w; l <= j + w; l++)
                        if ((k >= 0) && (k < N) && (l >= 0) && (l < N)) {
                            auto tr = abs(k - i) + abs(l - j);
                            if (tr == w) {
                                if (coordPossible[k][l].get(w, false) || (answer[k][l] == w)) {
                                    flag = false;
                                    break outer;
                                }
                            }
                        }
                // check if whole region for value w closer than tr
                bool flag2 = false;
                outer2: foreach (possibleRegion; regionPossible.byKey()) {
                    bool tmpFlag = true;
                    bool foundCell = false;
                    if (possibleRegion != regionOfCell[i][j])
                        foreach (coord; regionPossible[possibleRegion].get(w, emptyCoordsPossible).byKey()) {
                            if (abs(i - coord[0]) + abs(j - coord[1]) >= w) {
                                tmpFlag = false;
                            }
                            foundCell = true;
                        }
                    if (tmpFlag && foundCell) {
                        flag2 = true;
                        break outer2;
                    }
                }
                if ((flag) || (flag2)) {
                    coordPossible[i][j].remove(w);
                    regionPossible[regionOfCell[i][j]][w].remove(Coord(i,j));
                }
            }
}

bool[Coord][int][int] deepCopy(bool[Coord][int][int] aa) {
    bool[Coord][int][int] res;
    foreach (value, index_set; aa.byPair())
        foreach (index, coord_set; index_set.byPair())
            foreach (coord; coord_set.byKey())
                res[value][index][coord] = true;
    return res;
}

void clearCircles() {
    // remove already finished circle
    auto tmpCircle = deepCopy(circlePossible);
    foreach (value_key, circle_set; tmpCircle.byPair())
        foreach (circle_key, circle_coords; circle_set.byPair())
            foreach (coord; circle_coords.byKey())
                if (answer[coord[0]][coord[1]] == value_key)
                    circlePossible[value_key].remove(circle_key);
}
// delete value at coord(i,j) from possible arrays
void deleteValue(int i, int j, int value) {
    char reg_tmp = regionOfCell[i][j];
    foreach (coord; coordsOfRegion.get(reg_tmp, emptyCoordsPossible).byKey())
        coordPossible[coord[0]][coord[1]].remove(value);
    foreach (possible_value; regionPossible.get(reg_tmp, emptyRegionPossible).byKey())
        regionPossible[reg_tmp][possible_value].remove(Coord(i,j));
    auto tmpCircle = deepCopy(circlePossible);
    foreach (pair; tmpCircle.get(value, emptyCirclePossible).byPair()) {
        if (pair[1].length > 0) {
            if (Coord(i,j) in pair[1]) {
                circlePossible[value].remove(pair[0]);
            }
            else {
                auto tmpSet = setDifference(pair[1].byPair.array.sort, coordsOfRegion[reg_tmp].byPair.array.sort).assocArray;
                circlePossible[value][pair[0]] = tmpSet.dup;
            }
        }
    }
    tmpCircle = deepCopy(circlePossible);
    foreach (value_key, circle_set; tmpCircle.byPair())
        foreach (circle_key; circle_set.byKey())
            circlePossible[value_key][circle_key].remove(Coord(i,j));
    regionPossible[reg_tmp].get(value, emptyCoordsPossible).clear();
    coordPossible[i][j].clear();
}

// finding exact match from possible values
void findExact() {
    // coord search
    foreach (i; 0 .. N)
        foreach (j; 0 .. N)
            if (coordPossible[i][j].length == 1) {
                values[i][j] = coordPossible[i][j].keys[0];
                writeln("Coord finding [",i,"][",j,"]: ",values[i][j]);
                deleteValue(i, j, values[i][j]);
            }

    // region search
    foreach (region, set_number; regionPossible.byPair())
        foreach (number, set_coords; set_number.byPair())
            if (set_coords.length == 1) {
                auto tmp_c = set_coords.keys[0];
                int i = tmp_c[0];
                int j = tmp_c[1];
                values[i][j] = number;
                writeln("Region finding [",i,"][",j,"]: ",number);
                deleteValue(i, j, values[i][j]);
            }
    // circle search
    auto tmpCircle = deepCopy(circlePossible);
    foreach (number, set_circles; tmpCircle.byPair())
        foreach (circle, set_coords; set_circles.byPair())
            if (set_coords.length == 1) {
                auto tmp_c = set_coords.keys[0];
                int i = tmp_c[0];
                int j = tmp_c[1];
                if (coordPossible[i][j].get(number, false) == true) {
                    values[i][j] = number;
                    writeln("Circle finding [",i,"][",j,"]: ",number);
                    writeln("circle info: ", circle," ", set_coords);
                    deleteValue(i, j, values[i][j]);
                }
            }
}

void printAnswer() {
    foreach (i; 0 .. N) {
        foreach (j; 0 .. N)
            write(answer[i][j]," ");
        write("\n");
    }
}

void main()
{
    auto regFile = File("fregions.txt");
    auto valFile = File("fvalues.txt");

    // reading data about regions
    foreach (i; 0 .. N)
    {
        auto regLine = regFile.readln().strip;
        foreach (j; 0 .. N)
        {
            regionOfCell[i][j] = regLine[j];
            coordsOfRegion[regLine[j]][Coord(i,j)] = true;
        }
    }

    // each region filled with region's length
    foreach (k, v; coordsOfRegion.byPair())
        foreach (el; iota(1, v.length.to!int + 1))
            regionPossible[k][el] = coordsOfRegion[k].dup;

    // read prefilled values from file
    foreach (i; 0 .. N)
    {
        auto valLine = valFile.readln().strip;
        foreach (j; 0 .. N)
        {
            int cur = cast(int)(valLine[j] - '0');
            if (cur != 0)
            {
                values[i][j] = cur;
            }
        }
    }

    // fill possible values from regions information
    foreach (i; 0 .. N)
        foreach (j; 0 .. N) {
            foreach (posValue; regionPossible[regionOfCell[i][j]].byKey())
                coordPossible[i][j][posValue] = true;
            if (values[i][j] != 0) { // for (i,j) no other possible, exact value already found
                deleteValue(i,j,values[i][j]);
            }
        }

    int old_sum = -1;
    while (sum(answer.join) != old_sum) {
        old_sum = sum(answer.join);
        writeln("next interation");
        findExact();
        writeln("==value check start==");
        valueCheck();
        possibleCheck();
        writeln("------");
    }

    writeln("-Coord Possible-");
    writeln(coordPossible);
    writeln("-Region Possible-");
    writeln(regionPossible);
    writeln("-Circle Possible-");
    writeln(circlePossible);
    writeln("-Answer-");
    printAnswer();
    
    int res = 0;
    foreach (row; answer) {
        int tmp = 1;
        foreach (el; row)
            tmp *= el;
        res += tmp;
    }
    writeln("Final answer:", res);
}
