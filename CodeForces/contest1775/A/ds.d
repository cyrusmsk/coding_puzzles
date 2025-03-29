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
    auto s = readln.strip();
    auto start = s[0];
    auto end = s[$ - 1];
    if (start == end)
        writeln(start, " ", s[1..$ - 1], " ", end);
    else {
        if (start == 'b') {
            if (s[1] == 'a')
                writeln(start, " ", s[1], " ", s[2..$]);
            else
                writeln(start, " ", s[1..$ - 1], " ", end);
        }
        if (start == 'a') {
            if (s[1] == 'b')
                writeln(start, " ", s[1..$ - 1], " ", end);
            else
                writeln(start, " ", s[1], " ", s[2..$]);
        }
    }
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
