import std;

long makePrediction(long[] arr) {
    if (uniq(arr.dup.sort).array.length == 1) {
        return arr[0];
    }
    else {
        //writeln(arr);
        long[] diffArr;
        foreach(i; iota(arr.length - 1, 0, -1))
            diffArr ~= arr[i] - arr[i-1];
        return arr[$-1] + makePrediction(reverse(diffArr));
    }
}

long makePrediction2(long[] arr) {
    if (uniq(arr.dup.sort).array.length == 1) {
        return arr[0];
    }
    else {
        //writeln(arr);
        long[] diffArr;
        foreach(i; iota(arr.length - 1, 0, -1))
            diffArr ~= arr[i] - arr[i-1];
        return arr[0] - makePrediction2(reverse(diffArr));
    }
}

void p1() {
    auto data = readText("input.txt").split("\n");
    ulong res;
    foreach(line; data) {
        auto arr = line.split.map!(e => e.to!long).array;
        res += makePrediction(arr);
    }
    writeln(res);
}

void p2() {
    auto data = readText("input.txt").split("\n");
    long res;
    foreach(line; data) {
        auto arr = line.split.map!(e => e.to!long).array;
        auto tmp = makePrediction2(arr);
        res += tmp;
    }
    writeln(res);
}

void main() {
    p2();
}