import std.stdio : lines, writeln, File;
import std.range : walkLength;
import std.ascii : isDigit;
import std.uni : decompose, toLower, isNumber;
import std.algorithm : canFind;

immutable vowels = "aeiou";
immutable consonants = "bcdfghjklmnpqrstvwxyz";

string deAccent(dstring input) {
    string result;
    foreach (c; input.toLower) {
        auto decomposed = decompose(c);
        if (decomposed.length > 0)
            result ~= decomposed[0];
        else
            result ~= c;
    }
    return result;
}

bool check(dstring input)
{
    string pwd = deAccent(input);
    bool[char] dict;
    bool dig, vow, cons;
    
    if ((input.walkLength < 4 || input.walkLength > 12))
        return false;
    else
        foreach (ch; pwd)
        {
            if (ch.isNumber || ch.isDigit)
                dig = true;
            if (canFind(vowels, ch))
                vow = true;
            if (canFind(consonants, ch))
                cons = true;
            if (auto indict = ch in dict)
                return false;
            else
                dict[ch] = true;
        }
    return dig & vow & cons;
}

void main()
{
    File file = File("input.txt", "r");

    long counter;
    foreach (dstring pwd; lines(file))
        if (check(pwd[0..$-1]))
            counter++;
    writeln(counter);
}
