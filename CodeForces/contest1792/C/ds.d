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

const int MAX=200_010; 

void solve() {
    int n = read!int;
    auto p = readarray!int;
    p = [0] ~ p;
    int[MAX] dp;
    foreach(i; iota(1,n+1,1))
        dp[p[i]]=dp[p[i]-1]+1;
    auto ans=int.max;
    foreach(i; iota(1,n+1,1))
        ans=min(ans,max(i-dp[i],n-i));
    writeln(ans);
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
