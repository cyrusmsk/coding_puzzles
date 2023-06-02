import std.stdio;
import std.math;
import std.numeric;
import std.container;
import std.typecons;
import core.stdc.stdio : scanf;
import std.conv;
import std.array;
import std.string;
import std.range;
import std.algorithm;
import std.functional;
 
T read(T)() { return readln.chomp.to!T; }
T[] readarray(T)() { return readln.chomp.split(" ").map!(to!T).array; }

int binarySearch(alias pred, T)(in T[] as) { int lo = -1, hi = cast(int)(as.length); for (; lo + 1 < hi; ) { const mid = (lo + hi) >> 1; (unaryFun!pred(as[mid]) ? hi : lo) = mid; } return hi; }
int lowerBound(T)(in T[] as, T val) { return as.binarySearch!(a => (a >= val)); }
int upperBound(T)(in T[] as, T val) { return as.binarySearch!(a => (a > val)); }
 
void solve() {
    auto lrx = readarray!long;
    auto ab = readarray!long;
    if (ab[0] == ab[1]) {
            writeln(0);
            return;
    }
    else if ((lrx[0] + lrx[2] > ab[1]) && (lrx[1] - lrx[2] < ab[1])) {
        writeln(-1);
        return;
    }
    else {
        if (abs(ab[0] - ab[1]) >= lrx[2])
            writeln(1);
        else {
            if (abs(ab[0] - lrx[0]) >= lrx[2])
                if (lrx[2] + lrx[0] <= ab[1]) { //left
                    writeln(2);
                    return;
                }
            if (abs(lrx[1] - ab[0]) >= lrx[2])
                if (lrx[1] - lrx[2] >= ab[1]) { //right
                    writeln(2);
                    return;
                }
            if (abs(ab[0] - lrx[0]) >= lrx[2])
                if (lrx[2] + lrx[0] > ab[1]) { //left
                    writeln(3);
                    return;
                }
            if (abs(lrx[1] - ab[0]) >= lrx[2])
                if (lrx[1] - lrx[2] < ab[1]) { //right
                    writeln(3);
                    return;
                }
            writeln(-1);
        }
    }
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
