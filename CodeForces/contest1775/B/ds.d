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
    int n = read!int;
    int[][] c;
    int[int] f;
    foreach(_; 0..n) {
        auto tmp = readarray!int;
        c ~= tmp[1..$];
        foreach(e; tmp[1..$])
            f[e]++;
    }
    bool flag = false;
    outer: foreach(i; 0..n) {
        foreach(e; c[i]) {
            if (f[e] == 1)
                continue outer;
            flag = true;
        }
        if (flag) {
            writeln("yes");
            return;
        }
    }
    writeln("no");
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
