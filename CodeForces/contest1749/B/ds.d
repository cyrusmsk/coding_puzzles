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
    dchar[] s = readln.strip.to!(dchar[]);
    s = s.uniq.array;
    auto s1 = s.dup;
    foreach(ref e; s1)
        if (e == '0')
            e = '1';
        else
            e = '0';

    if (n == 1) {
        writeln(0);
        return;
    }
    int res;
    bool flip = false;
    bool up = true;
    n = cast(int) s.length;
    foreach(i; 0 .. n) {
        if (i != n - 1) {
            if (up) {
                if (s[i] > s[i+1]) {
                    res++;
                    flip = true;
                    up = !up;
                }
            }
            else {
                if (s1[i] > s1[i+1]) {
                    res++;
                    up = !up;
                }
            }
        }
    }
    if (flip)
        if (up) {
            if (s[n-1] == '0') {
                res++;
            }
        }
        else {
            if (s1[n-1] == '0') {
                res++;
            }
        }
    writeln(res);
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
