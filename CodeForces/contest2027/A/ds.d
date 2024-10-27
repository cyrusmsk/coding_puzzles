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
    int[][int] w_x_h;
    long result;

    foreach(i; 0..n) {
        auto pair = readarray!int;
        w_x_h[pair[0]] ~= pair[1];
    }
    auto sorted_weights = w_x_h.keys().sort!"a > b";
    int previos_weight = 0;
    int previos_height = 0;
    foreach(w; sorted_weights) {
        int tmp = maxElement(w_x_h[w]);
        if (tmp > previos_height) {
            result += abs(previos_weight - w);
            previos_weight = w;
            result += tmp - previos_height; 
            previos_height = tmp;
        }
    }
    result += previos_height + previos_weight;
    writeln(result);
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
