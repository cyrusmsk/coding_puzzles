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

T read(T)()
{
    return readln.chomp.to!T;
}

T[] readarray(T)()
{
    return readln.chomp.split(" ").map!(to!T).array;
}

int binarySearch(alias pred, T)(in T[] as)
{
    int lo = -1, hi = cast(int)(as.length);
    for (; lo + 1 < hi;)
    {
        const mid = (lo + hi) >> 1;
        (unaryFun!pred(as[mid]) ? hi : lo) = mid;
    }
    return hi;
}

int lowerBound(T)(in T[] as, T val)
{
    return as.binarySearch!(a => (a >= val));
}

int upperBound(T)(in T[] as, T val)
{
    return as.binarySearch!(a => (a > val));
}

void solve()
{
    auto a = readarray!long;
    long alice, bob;
    long res;
    if (a[0] == 0)
    {
        writeln(1);
        return;
    }
    res += a[0];
    alice += a[0];
    bob += a[0];
    a[0] = 0;

    res += 2 * min(a[1], a[2]);
    long tmp = min(a[1], a[2]);
    a[1] -= tmp;
    a[2] -= tmp;

    if (a[1] != 0)
    {
        tmp = min(a[1], bob);
        res += tmp;
        a[1] -= tmp;
        bob -= tmp;
        alice += tmp;
    }
    if (a[2] != 0)
    {
        tmp = min(a[2], alice);
        res += tmp;
        a[2] -= tmp;
        alice -= tmp;
        bob += tmp;
    }
    if (a[3] != 0)
    {
        tmp = min(alice, bob, a[3]);
        res += tmp;
        a[3] -= tmp;
    }
    if (sum(a) != 0)
    {
        res++;
    }
    writeln(res);
}

void main()
{
    int T = read!int;
    foreach (t; 0 .. T)
        solve();
}
