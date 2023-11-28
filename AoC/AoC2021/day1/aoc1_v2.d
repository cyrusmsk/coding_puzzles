import std;

void main() {
    stdin
        .byLineCopy
        .map!(e => e.to!int)
        .array.slide(3)
        .map!(e => e.sum())
        .slide(2)
        .fold!((a, e) => a + (e[0] < e[1] ? 1 : 0))(0)
        .writeln;
}
