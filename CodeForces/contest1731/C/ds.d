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
 
bool hasEvenDeviser(int n) {
    if (n == 0)
        return false;

    int root_n = cast(int) sqrt(cast(float)n);
    if (root_n * root_n == n)
        return false;
    else
        return true;
}

void solve() {
    int n = read!int;
    auto a = readarray!int;
    long res;
    for(int i = 0; i < n; i++) {
        int tmp = a[i];
        if (hasEvenDeviser(tmp))
            res++;
        for(int j = i + 1; j < n; j++) {
            tmp ^= a[j];
            if (hasEvenDeviser(tmp))
                res++;
        }
    }
    writeln(res);
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
