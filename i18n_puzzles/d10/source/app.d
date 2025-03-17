import std;
import std.uni : normalize, NFC, NFD;
import std.range;
import passwd;
import passwd.bcrypt;

string[string] dict;
string[string] real_pass;

int[][] combination(int[] s, in int m) pure nothrow @safe {
  if (!m) return [[]];
  if (s.empty) return [];
  return s[1 .. $].combination(m - 1).map!(x => s[0] ~ x).array ~ s[1 .. $].combination(m);
}

int[][] variants(int[] lst) {
  return iota(cast(int)lst.length + 1).map!(e => combination(lst, e)).join;
}

long check_attempt(string login, string pwd) {
    if (auto f = login in real_pass) {
        if (*f == normalize!NFC(pwd))
            return 1;
        else
            return 0;
    }
    string norm_pwd = normalize!NFD(pwd);
    auto comb = enumerate(cast(ubyte[]) norm_pwd).filter!(e => e.value == 204).map!(e => e.index).array.to!(int[]);

    foreach(dec; variants(comb)) {
        auto chk = cast(ubyte[])norm_pwd;
        foreach_reverse(rep; dec)
            chk = chk[0..rep-1] ~ cast(ubyte[])normalize!NFC(cast(string)chk[rep - 1..rep + 2]) ~ chk[rep + 2..$];
        if ((cast(string) chk).canCryptTo(dict[login])) {
            real_pass[login] = normalize!NFC(pwd);
            return 1;
        }
    }
    return 0;
}

void main()
{
    File file = File("input.txt", "r");

    long result;

    foreach (string line; lines(file))
    {
        if (line == "\n" || line.empty)
        {
            break;
        }
        auto s = line.toUTF8.strip.split;
        dict[s[0]] = s[1];
    }

    foreach(string line; lines(file)) {
        auto x = line.toUTF8.split;
        auto r = check_attempt(x[0], x[1]);
        result += r;
    }

    writeln("Result:", result);
}
