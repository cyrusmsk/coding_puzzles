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
    auto result = a[0];
    foreach(i; 1 .. n) {
        result = gcd(result, a[i]);
    }
    if (result == 1) {
        writeln(0);
        return;
    }
    if (n == 1)
        writeln(1);
    else if (gcd(result, gcd(n,a[n-1])) == 1)
        writeln(1);
    else if (gcd(result, gcd(n-1,a[n-2])) == 1)
        writeln(2);
    else
        writeln(3);
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
