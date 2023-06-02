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

bool[ulong] d;

void solve(char s, ulong x) {
    scanf("%c %llu\n", &s, &x);
    if (s == '+')
        d[x] = true;
    else {
        foreach(i; 1 .. 10 ^^ 5) {
            if (x * i in d)
                continue;
            else {
                writeln(x * i);
                break;
            }
        }
    }
}

void main() {
    int T = read!int;
    d[0] = true;
    char s;
    ulong x;
    foreach (t; 0 .. T) solve(s, x);
}
