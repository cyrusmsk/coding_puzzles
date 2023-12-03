import std;

void p1() {
    auto data = readText("input.txt").split("\n");
    long res = 0;

    bool checkNumber(int i, int j, int len) {
        foreach(x; max(0, i-1) .. min(data.length, i+2))
            foreach(y; max(0, j-1) .. min(data[i].length, j+len+1))
                if (data[x][y] != '.' && !data[x][y].isDigit)
                    return true;
        return false;
    }

    foreach(ref i; 0..cast(int)data.length) {
        foreach(ref j; 0..cast(int)data[i].length) {
            if (data[i][j] == '.')
                continue;
            else if (data[i][j].isDigit) {
                auto k = j;
                while (k < data[i].length)
                    if (data[i][k].isDigit)
                        k++;
                    else
                        break;
                if (checkNumber(i,j,k-j)) {
                    //writeln(data[i][j..k]);
                    res += data[i][j..k].to!long;
                }
                j = k;
            }
        }
    }
    writeln(res);
}

void p2() {
    auto data = readText("input.txt").split("\n");
    long[][Tuple!(size_t, size_t)] gears;

    void saveGear(size_t x, size_t y, long num) {
        gears[tuple(x,y)] ~= num;
    }

    void findGears(int i, int j, int len, long num) {
        foreach(x; max(0, i-1) .. min(data.length, i+2))
            foreach(y; max(0, j-1) .. min(data[i].length, j+len+1))
                if (data[x][y] == '*')
                    saveGear(x,y,num);
    }

    foreach(ref i; 0..cast(int)data.length) {
        foreach(ref j; 0..cast(int)data[i].length) {
            if (data[i][j] == '.')
                continue;
            else if (data[i][j].isDigit) {
                auto k = j;
                while (k < data[i].length)
                    if (data[i][k].isDigit)
                        k++;
                    else
                        break;
                findGears(i,j,k-j, data[i][j..k].to!long);
                j = k;
            }
        }
    }
    writeln(gears.values.filter!(a => a.length == 2).map!(e => e.fold!"a*b").sum);
}

void main() {
    p2();
}
