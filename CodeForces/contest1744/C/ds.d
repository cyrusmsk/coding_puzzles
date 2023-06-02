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
    int n;
    char r;
    readf!" %d %c "(n, r);
    //scanf("%d %c\n", &n, &r);
    auto s = readln.strip;
    if (r == 'g') {
        writeln(0);
        return;
    }
    long fromStart;
    bool foundG, countR;
    long tmp, maxD;
    foreach(i, el; s) {
        if (el == 'g') {
            foundG = true;
            if (tmp > maxD)
                maxD = tmp;
            countR = false;
            tmp = 0;
        }
        if (el == r)
            countR = true;
        if (countR)
            tmp++;
        if (!foundG)
            fromStart++;
    }
    if (countR)
        writeln(max(maxD, tmp+fromStart));
    else
        writeln(maxD);

}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
