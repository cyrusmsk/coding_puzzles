import std;

long[][] readPart(string input) {
    long[][] res;
    foreach(l; input.split("\n")[1..$])
        res ~= l.split.map!(e => e.to!long).array;
    return res;
}

void p1() {
    auto data = readText("input.txt").split("\n\n");
    long[] seeds = data[0].split(": ")[1].split.map!(e => e.to!long).array;
    long[][][] gates;
    long[] locations;

    foreach(part; data[1..$])
        gates ~= readPart(part);
    foreach(seed; seeds) {
        auto res = seed;
        outer: foreach(part; gates) {
            foreach(line; part) {
                if (res >= line[1] && res < (line[1] + line[2])) {
                    res = res - line[1] + line[0];
                    continue outer;
                }
            }
        }
        locations ~= res;
    }
    writeln(minElement(locations));
}

void p2() {
    auto data = readText("input.txt").split("\n\n");
    auto tmp = data[0].split(": ")[1].split.map!(e => e.to!long).array;
    long[][] seeds = chunks(tmp, 2).array.sort!"a[0] < b[0]".array;
    long[][][] gates;

    long[][] locations;

    foreach(part; data[1..$])
        gates ~= readPart(part);
    
    foreach(i, ref part; gates) {
        part = part.sort!"a[1] < b[1]".array;
        //writeln("Level ",i, ": ",part);
    }

    //writeln(seeds);
    //writeln("-------");
    long[][] process(long[][] input, long[][] gates) {
        long[][] res;
        foreach(k, arr; input) {
            long[] remain = arr;
            foreach(gate; gates) {
                if (remain.length == 0)
                    break;
                if (remain[0] < gate[1]) { // part I
                    if (remain[0]+remain[1] - 1 >= gate[1]) { // <..[..>..
                        if (remain[0] + remain[1] - 1 <= gate[1] + gate[2] - 1) { // <..[..>..]
                            res ~= [remain[0], gate[1] - remain[0]];
                            res ~= [gate[0], remain[0] + remain[1] - gate[1]];
                            remain = [];
                        }
                        else { // <..[..]..>
                            res ~= [remain[0], gate[1] - remain[0]];
                            res ~= [gate[0], gate[2]];
                            remain = [gate[1] + gate[2], remain[0] + remain[1] - gate[1] - gate[2]];
                        }
                    }
                    else { // <..>..[..
                        res ~= remain;
                        remain = [];
                    }
                }
                else if (remain[0] >= gate[1] && remain[0] <= gate[1] + gate[2] - 1) { // part II
                    if (remain[0] + remain[1] - 1 <= gate[1] + gate[2] - 1) { // ..[..<..>..]
                        res ~= [gate[0] + remain[0] - gate[1], remain[1]];
                        remain = [];
                    }
                    else { // ..[..<..]..>
                        res ~= [gate[0] + remain[0] - gate[1], gate[1] + gate[2] - remain[0]];
                        remain = [gate[1] + gate[2], remain[0] + remain[1] - gate[1] - gate[2]];
                    }
                }
                else if (remain[0] > gate[1] + gate[2] - 1) { // part III
                    continue;
                }
            }
            if (remain.length) {
                res ~= remain;
                remain = [];
            }
        }
        return res.sort!"a[0] < b[0]".array;
    }

    locations = seeds;
    foreach(level; gates) {
        locations = process(locations, level);
    }
    writeln("Final:", locations);
    writeln(locations.minElement!"a[0]"[0]);
}

void main() {
    p2();
}
