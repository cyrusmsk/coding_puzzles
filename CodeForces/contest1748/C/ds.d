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
    auto s = readarray!long;
    long[long] d;
    long cur_sum, res;
    int i = 0;
    bool flag = false;
    while (i < s.length) {
        cur_sum += s[i];
        //writeln("sum", cur_sum);
        if (flag) {
            if (s[i] == 0) {
                auto m_key = d.byPair.maxElement!(p => p.value);
                cur_sum += m_key.key;
                res += m_key.value;
                d.clear();
            }
            d[cur_sum] = 1 + d.get(cur_sum, 0);
        }
        else if (s[i] == 0) {
            flag = true;
            d[cur_sum] = 1 + d.get(cur_sum, 0);
        }
        else if (cur_sum == 0)
            res++;
        i++;
    }
    if (!d.empty) {
        auto m_key = d.byPair.maxElement!(p => p.value);
        cur_sum += m_key.key;
        res += m_key.value;
    }
    writeln(res);
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
