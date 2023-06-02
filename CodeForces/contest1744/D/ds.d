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
    auto a = readarray!long;
    long twos;
    foreach(el; a)
        if (!(el & 1)) {
            while(el % 2 == 0) {
                el >>= 1;
                twos++;
            }
        }
    if (twos >= n)
        writeln(0);
    else {
        long[] oper;
        foreach(el;iota(n,0,-1).array) {
            if (!(el & 1)) {
                long tmp;
                while(el % 2 == 0) {
                    el >>= 1;
                    tmp++;
                }
                oper ~= tmp;
            }
        }
        sort!"a > b"(oper);
        n -= twos;
        foreach(i, el; oper)
            if (el >= n) {
                writeln(i+1);
                return;
            }
            else
                n -= el;

        writeln(-1);
    }
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
