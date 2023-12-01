import std;

void p1() {
    stdin
        .byLineCopy
        .map!(e => e.filter!(a => a.isDigit).array)
        .map!(e => to!uint([e[0], e[$-1]]))
        .sum
        .writeln;
}


const words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];

string replaceNumbers(string s, bool forward) {
    string res;
    if(forward) {
    int i = 0;
    outer: while(i < s.length) {
            if(s[i].isDigit){
                res ~= s[i];
                i++;
            }
            else {
                foreach(k, w; words)
                    if (s[i..$].startsWith(w)) {
                        res ~= to!string(k+1);
                        i += w.length;
                        continue outer;
                    }
                i++;
            }
        }
    }
    else {
    int i = cast(int)s.length - 1;
    outerre: while(i >= 0) {
            if(s[i].isDigit){
                res ~= s[i];
                i--;
            }
            else {
                foreach(k, w; words)
                    if (s[0..i + 1].endsWith(w)) {
                        res ~= to!string(k+1);
                        i -= w.length;
                        continue outerre;
                    }
                i--;
            }
        }
    }
    if (!forward)
        res = res.dup.reverse;
    return res;
}

void p2() {
    stdin
        .byLineCopy
        .map!(e => to!uint([e.replaceNumbers(true)[0], e.replaceNumbers(false)[$-1]]))
        .sum
        .writeln;
}
void main() {
    p2();
}
