import std;

void ls(long x, long y)
{
    writeln(x);
    writeln(y);
}

void main() {
    long x, y, z;
    auto arr = stdin
        .byLineCopy
        .map!(e => e.split())
        .array;
    foreach (el; arr) {
        if (el[0] == "forward") {
            x += to!long(el[1]);
            y += z*to!long(el[1]);
        }
        else if (el[0] == "up") {
           //y -= to!long(el[1]);
            z -= to!long(el[1]);
        }
        else {
            //y += to!long(el[1]);
            z += to!long(el[1]);
        }
    }
    writeln(x*y);
}
