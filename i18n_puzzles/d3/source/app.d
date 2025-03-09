import std.stdio : lines, writeln, File;
import std.range : walkLength;
import std.ascii : isASCII, isDigit;
import std.uni : isAlpha, isUpper, isLower, isNumber;

bool check(dchar[] pwd) {
    if (pwd.walkLength < 4 || pwd.walkLength > 12)
        return false;

    bool dig, up, low, noascii;
    foreach(ch; pwd) {
        if (ch.isNumber || ch.isDigit)
            dig = true;
        if (ch.isAlpha && ch.isUpper)
            up = true;
        if (ch.isAlpha && ch.isLower)
            low = true;
        if (!ch.isASCII)
            noascii = true;
    }
    return dig & up & low & noascii;
}

void main() {
    File file = File("input.txt", "r");

    long counter;
    foreach(dchar[] pwd; lines(file)) {
        if (check(pwd[0..$-1])) {
            counter++;
        }
    }
    writeln(counter);
}
