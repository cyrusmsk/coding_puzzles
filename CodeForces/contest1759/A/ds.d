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
    auto x = readln.strip();
    bool norm = true;
outer: foreach(i, e; x) {
        if (i == 0) {
            if ((e != 'Y') && (e != 'e') && (e !='s')) {
                norm = false;
                break outer;
            }
        }
        else {
            if ((e == 'Y' && x[i-1] == 's') || (e == 'e' && x[i-1] == 'Y') || (e == 's' && x[i-1] == 'e'))
                continue;
            else {
                norm = false;
                break outer;
            }
        }
    }
    if (norm)
        writeln("yes");
    else
        writeln("no");

}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
