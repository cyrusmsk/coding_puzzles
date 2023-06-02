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
    long n, h;
    readf!" %d %d "(n, h);
    auto a = readarray!long;
    sort(a);
    long res;
    short green = 2;
    short blue = 1;
    foreach(cosm; a) {
        if (cosm < h) {
            h += cosm / 2;
            res++;
        }
        else if (cosm == 1 && h == 1) {
            res++;
        }
        else {
            if ((green > 0) && (2*h > cosm)) {
                green--;
                h *= 2;
                h += cosm / 2;
                res++;
            }
            else if ((blue>0) && (3*h > cosm)) {
                blue--;
                h *= 3;
                h += cosm / 2;
                res++;
            }
            else if ((green > 1) && (4*h > cosm)) {
                green -= 2;
                h *= 4;
                h += cosm / 2;
                res++;
            }
                        else if ((green>0) && (blue>0) && (6*h > cosm)) {
                green--;
                blue--;
                h *= 6;
                h += cosm / 2;
                res++;
            }else if ((green>1) && (blue>0) && (12*h > cosm)) {
                green -= 2;
                blue--;
                h *= 12;
                h += cosm / 2;
                res++;
            }

            else
                break;
        }
    }
    writeln(res);
}

void main() {
    int T = read!int;
    foreach (t; 0 .. T) solve();
}
