import std;

void p1() {
    auto data = readText("input.txt").split("\n");
    long res;

    foreach(line; data) {
        string inStr;
        int cardId;
        formattedRead(line, "Card %d: %s", cardId, inStr);
        auto tmp = inStr.split(" | ");
        auto winArr = tmp[0].strip.split.map!(e => e.to!int).array.sort;
        auto ourArr = tmp[1].strip.split.map!(e => e.to!int).array.sort;
        auto cnt = setIntersection(winArr, ourArr).array.length;
        res += cnt > 0 ? pow(2, cnt - 1) : 0;
    }
    writeln(res);
}
void p2() {
    auto data = readText("input.txt").split("\n");
    long res;
    int[int] cards;
    foreach(line; data) {
        string inStr;
        int cardId;
        formattedRead(line, "Card %d: %s", cardId, inStr);
        auto tmp = inStr.split(" | ");
        auto winArr = tmp[0].strip.split.map!(e => e.to!int).array.sort;
        auto ourArr = tmp[1].strip.split.map!(e => e.to!int).array.sort;
        auto cnt = setIntersection(winArr, ourArr).array.length;
        cards[cardId] += 1; // original
        foreach(cardNum; cardId..(cardId+cnt))
            cards[cast(int)(cardNum+1)] += cards[cardId];
    }
    writeln(cards.values.sum);
}

void main() {
    p2();
}
