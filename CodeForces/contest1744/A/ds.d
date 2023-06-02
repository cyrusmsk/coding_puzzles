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
 
T read(T)() { return readln.chomp.to!T; }
T[] readarray(T)() { return readln.chomp.split(" ").map!(to!T).array; }
 
void solve() {
    int n = read!int;
    auto a = readarray!int;
    auto s = readln.strip;
    dchar[int] dict;
    foreach (tup; zip(a, s))
    {
        if (tup[0] in dict)
            if (dict[tup[0]] != tup[1]) {
                writeln("NO");
                return;
            }
        dict[tup[0]] = tup[1];
    }
    writeln("YES");
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
