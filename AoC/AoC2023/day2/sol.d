import std;

void p1() {
    bool checkSize(string[] arr) {
        if (arr[1] == "red")
            return to!int(arr[0]) <= 12 ? true : false;
        else if (arr[1] == "blue")
            return to!int(arr[0]) <= 14 ? true : false;
        else if (arr[1] == "green")
            return to!int(arr[0]) <= 13 ? true : false;
        return false;
    }

    stdin
        .byLineCopy
        .map!(e => e.split(": "))
        .map!(e => tuple(e[0].split(" ")[1], e[1].replace(";",",").split(",")))
        .map!(e => tuple(e[0], e[1].map!(a => a.strip.split(" ")).array))
        .map!(e => tuple(e[0], all!checkSize(e[1])))
        .filter!(e => e[1] == true)
        .map!(e => to!int(e[0]))
        .sum
        .writeln;
}

void p2() {
    int[3] toRGB(string[] arr) {
        int[3] res;
        if (arr[1] == "red")
            res[0] = to!int(arr[0]);
        else if (arr[1] == "blue")
            res[1] = to!int(arr[0]);
        else if (arr[1] == "green")
            res[2] = to!int(arr[0]);
        return res;
    }

    int[3] maxCube(int[3] l, int[3] r) {
        return [max(l[0],r[0]), max(l[1],r[1]), max(l[2],r[2])];
    }

    stdin
        .byLineCopy
        .map!(e => e.split(": ")[1])
        .map!(e => e.replace(";",",").split(","))
        .map!(e => e.map!(a => a.strip))
        .map!(e => e.map!(a => toRGB(a.split(" "))))
        .map!(e => e.fold!(maxCube))
        .map!(e => e.fold!"a * b")
        .sum
        .writeln;
}

void main() {
    p2();
}
