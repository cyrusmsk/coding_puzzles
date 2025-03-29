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
    long n, x;
    readf!" %d %d "(n,x);
    string s = format("%b", n);
    if (x > n)
        writeln(-1);
    else if (x == n)
        writeln(n);
    else if (x == 0) {
        auto s1 = "1" ~ ("0".repeat(s.length)).join();
        writeln(to!long(s1,2));
    }
    else {
        for (int i = cast(int)s.length - 1; i >= 0; i--) {
            if (s[i] == '1') {
                int j = i;
                while((s[j] == '1') && (j >= 0)) {
                    j -= 1;
                }
                if (j < 0) {
                    writeln(-1);
                    return;
                }
                if ( to!long((s[0..j] ~ ("0".repeat(s.length - j)).join()),2) == x) {
                    writeln(to!long((s[0..j] ~ "1" ~ ("0".repeat(s.length - j - 1)).join()),2));
                    return;
                }
                i = j;
            }
        }
        writeln(-1);
    }
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
