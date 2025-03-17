import std.stdio : lines, writeln, File;
import std.range;
import std.uni;
import std.algorithm;
import std.string;
import std.array;
import std.conv;

immutable biga = "ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ";
immutable smalla = "αβγδεζηθικλμνξοπρστυφχψω";

immutable bigaa = zip(biga, iota(biga.length)).assocArray;
immutable smallaa = zip(smalla, iota(smalla.length)).assocArray;

immutable aabig = zip(iota(biga.length), biga).assocArray;
immutable aasmall = zip(iota(smalla.length), smalla).assocArray;

immutable answers = zip(["Οδυσσευς", "Οδυσσεως", "Οδυσσει", "Οδυσσεα", "Οδυσσευ"], iota(5)).assocArray;

bool check(string s, int i)
{
    string res;
    foreach(ch; s.byCodePoint) {
        auto nch = ch;
        if (ch == 'ς')
            nch = 'σ';
        if (auto f = nch in smallaa)
            res ~= aasmall[(*f+i) % 24];
        else if (auto f = nch in bigaa)
            res ~= aabig[(*f+i) % 24];
        else
            res ~= " ";
    }
    foreach(word; res.split) {
        auto tmp = word.byCodePoint.array;
        if (tmp[$-1] == 'σ')
            tmp[$-1] = 'ς';
        string f = tmp.byCodePoint.text;
        if (auto z = f in answers) {
            return true;
        }
    }
    return false;
}

void main()
{
    File file = File("input.txt", "r");

    int result;
obs: foreach (string pwd; lines(file))
        foreach(i; 1..24)
            if (check(pwd.strip(), i)) {
                result += i;
                continue obs;
            }
    writeln(result);
}
