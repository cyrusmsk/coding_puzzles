import std;

struct Point {
    size_t x,y;
}

// 0 - down, 1 - up, 2 - left, 3 - right
long makePath(Point current, size_t direction, long len) {
}

void p1() {
    char[][] data = readText("sample.txt").split("\n").map!(e => e.to!(char[])).array;
    Point start;
    foreach(row, line; data)
        foreach(col, el; line)
            if (el == 'S')
                start = Point(row, col);
    long[4] loopLens;
}

void main() {
    p1();
}