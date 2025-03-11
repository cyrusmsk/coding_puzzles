import std;

void main()
{
    File file = File("input.txt", "r");

    dchar poo = '💩';
    dstring[] park;

    // reading
    foreach(dstring park_line; lines(file)) {
        park ~= park_line[0..$-1];
    }

    // walking
    int i = 0;
    long result;
    int park_wide = cast(int)park[0].length;
    foreach(line; park) {
        if (line[i] == poo)
            result++;
        i = (i+2) % park_wide;
    }
    writeln(result);
}
