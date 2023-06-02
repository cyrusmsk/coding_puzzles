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
    auto a = readarray!long;
    a.sort!("a > b");
    long res1, res2;
    int minI = n - 1;
    foreach(i; 0 .. minI - 1) {
        if (abs(a[minI] - a[i]) + abs(a[i] - a[i+1]) > res1)
            res1 = abs(a[minI] - a[i]) + abs(a[i] - a[i+1]);
    }
    foreach(i; iota(n-1,1,-1).array) {
        if (abs(a[0] - a[i]) + abs(a[i] - a[i-1]) > res2)
            res2 = abs(a[0] - a[i]) + abs(a[i] - a[i-1]);
    }
    writeln(max(res1, res2));
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
