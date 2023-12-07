import std;

string hexit(string str, bool firstPart = true) {
    string tmp;
    if (firstPart)
        tmp = str.replace("A", "f").replace("J","b").replace("Q","c").replace("K","d").replace("T", "a");
    else
        tmp = str.replace("A", "f").replace("J","1").replace("Q","c").replace("K","d").replace("T", "a");
    long oct = tmp.to!int(16);
    return format("%02x", oct);
}

int processCard(string str) {
    auto res = str.array.sort!((a, b) => a < b)
            .group
            .assocArray;
    int coef;
    foreach(cnt; res.byValue) {
        if (cnt == 5) {
            coef = 6;
            break;
        }
        else if (cnt == 4) {
            coef = 5;
            break;
        }
        else if (cnt == 3) {
            if (res.values.length == 2)
                coef = 4;
            else
                coef = 3;
            break;
        }
        else if (cnt == 2) {
            if (res.values.length == 3)
                coef = 2;
            else if (res.values.length == 2)
                coef = 4;
            else
                coef = 1;
            break;
        }
        else if (cnt == 1) {
            if (res.values.length == 5) {
                coef = 0;
                break;
            }
        }
    }
    return coef;
}

int processJoker(string str) {
    auto res = str.filter!(c => c != 'J').array.sort!((a, b) => a < b)
            .group
            .assocArray;
    long jockers = str.filter!(c => c == 'J').array.length;
    int maxCnt;
    if (jockers != 5)
        maxCnt = res.values.maxElement;
    else
        return 6;
    int coef;
    foreach(cnt; res.byValue) {
        if (cnt == maxCnt)
            cnt += jockers;
        if (cnt == 5) {
            coef = 6;
            break;
        }
        else if (cnt == 4) {
            coef = 5;
            break;
        }
        else if (cnt == 3) {
            if (res.values.length == 2)
                coef = 4;
            else
                coef = 3;
            break;
        }
        else if (cnt == 2) {
            if (res.values.length == 3)
                coef = 2;
            else if (res.values.length == 2)
                coef = 4;
            else
                coef = 1;
            break;
        }
        else if (cnt == 1) {
            if (res.values.length == 5) {
                coef = 0;
                break;
            }
        }
    }
    return coef;
}

struct Cards {
    long bid;
    string initCards;
    string hexCards;
    int points;
}

void p1() {
    auto data = readText("input.txt").split("\n").map!(e => e.split).array;
    auto tmp = data.map!(e => Cards(e[1].to!long, e[0], hexit(e[0]), processCard(e[0]))).array;
    tmp = multiSort!("a.points > b.points", "a.hexCards > b.hexCards")(tmp).array;
    long res;
    foreach(i, e; reverse(tmp))
        res += (i+1)*e.bid;
    writeln(res);
}

void p2() {
    auto data = readText("input.txt").split("\n").map!(e => e.split).array;
    auto tmp = data.map!(e => Cards(e[1].to!long, e[0], hexit(e[0], false), processJoker(e[0]))).array;
    tmp = multiSort!("a.points > b.points", "a.hexCards > b.hexCards")(tmp).array;
    long res;
    foreach(i, e; reverse(tmp))
        res += (i+1)*e.bid;
    writeln(res); 
}

void main() {
    p2();
}