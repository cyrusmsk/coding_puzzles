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
    int n, q;
    readf!" %d %d "(n, q);
    auto a = readarray!long;
    long odds, evens;
    long oddn, evenn;
    foreach(el; a) {
        if (el & 1) {
            odds += el;
            oddn++;
        }
        else {
            evens += el;
            evenn++;
        }
    }
    foreach(casenum; 0 .. q) {
        byte type;
        long x;
        readf!" %d %d "(type, x);
        if (type == 0) {
            evens += evenn*x;
            writeln(odds + evens);
            if (x & 1) {
                oddn += evenn;
                odds += evens;
                evenn = 0;
                evens = 0;
            }
        }
        else {
            odds += oddn*x;
            writeln(odds + evens);
            if (x & 1) {
                evenn += oddn;
                evens += odds;
                oddn = 0;
                odds = 0;
            }
        }
    }
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
