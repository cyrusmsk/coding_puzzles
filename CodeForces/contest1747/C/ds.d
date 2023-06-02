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

    if (a[0] == 1)
        writeln("Bob");
    else {
        long alice = minIndex(a[1..$]);
        long bob;
        if (alice + 3 < n)
            bob = minElement(a[1..cast(uint)(alice + 1)] ~ a[cast(uint)(alice + 2) .. $]);
        else {
            if (alice > 0)
                bob = minElement(a[1..cast(uint)(alice + 1)]);
            else
                bob = a[0] - 1;
        }
        if (min(bob, a[0] - 1) < a[cast(uint)(alice + 1)])
            writeln("Bob");
        else
            writeln("Alice");
    }
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
