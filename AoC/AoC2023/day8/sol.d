import std;

Node[string] genMap(string s) {
    string curr, lPath, rPath;
    Node[string] map;
    foreach(line; s.split("\n")) {
        formattedRead(line, "%s = (%s, %s)", curr, lPath, rPath);
        map[curr] = Node(lPath, rPath);
    }
    return map;
}

struct Node {
    string L, R;
}

void p1() {
    auto data = readText("input.txt").split("\n\n");
    auto commands = data[0].cycle;
    auto paths = data[1];
    auto map = genMap(paths);
    auto current = "AAA";
    long res = 0;
    while (current != "ZZZ") {
        if (commands.front().to!string == "L")
            current = map[current].L;
        else
            current = map[current].R;
        commands.popFront();
        res++;
    }
    writeln(res);
}

string[] endsA (string str) {
    string[] res;
    foreach(line; str.split("\n")) {
        string tmp = line.split(" = ")[0];
        if (tmp.endsWith("A"))
            res ~= tmp;
    }
    return res;
}

bool endsZ (string str) {
    if (!str.endsWith("Z"))
        return false;
    return true;
}

void p2() {
    auto data = readText("input.txt").split("\n\n");
    auto commands = data[0].cycle;
    auto paths = data[1];
    auto mapping = genMap(paths);
    string[] current = endsA(paths);
    ulong[] res;
    foreach(start; current) {
        ulong tmp;
        while (!endsZ(start)) {
            if (commands.front().to!string == "L")
                start = mapping[start].L;
            else
                start = mapping[start].R;
            commands.popFront();
            tmp++;
        }
        res ~= tmp;
    }
    //writeln(data[0].length);
    //writeln(res);
    writeln(res.fold!lcm);
}

void main() {
    p2();
}