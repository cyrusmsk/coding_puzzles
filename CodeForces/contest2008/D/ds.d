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
import core.sys.solaris.libelf;
 
T read(T)() { return readln.chomp.to!T; }
T[] readarray(T)() { return readln.chomp.split(" ").map!(to!T).array; }

int binarySearch(alias pred, T)(in T[] as) { int lo = -1, hi = cast(int)(as.length); for (; lo + 1 < hi; ) { const mid = (lo + hi) >> 1; (unaryFun!pred(as[mid]) ? hi : lo) = mid; } return hi; }
int lowerBound(T)(in T[] as, T val) { return as.binarySearch!(a => (a >= val)); }
int upperBound(T)(in T[] as, T val) { return as.binarySearch!(a => (a > val)); }
 


void solve() {
    int n = read!int;
    int[] p = readarray!int;
    string s = readln.strip;
    int[] c = new int[](n);
    int[] cnt = new int[](n+1);

    int color;
    foreach(k; 0..n)
        if (!c[k]) {
            color++;
            auto next = k;
            while (!c[next]) {
                if (s[next] == '0')
                    cnt[color] ++;
                c[next] = color;
                next = p[next] - 1;
            }
        }
    int[] res = new int[](n);
    foreach(i;0..n)
        res[i] = cnt[c[i]];
    writeln("ans:", res);
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
