import std;

ulong fish(int state, int time){
    ulong res = 1L;
    for (int i = 0; i < time; i++)
    {
        state--;
        if (state < 0){
            res += fish(8, time - i - 1);
            state = 6;
        }
    }
    return res;
}

void main() {
    auto arr = readln.strip.split(",").to!(int[]);
    ulong[] result;
    auto sarr = uniq(arr.sort());
    int[] ssarr;
    foreach(el;sarr)
        ssarr ~= el;
    foreach(el; parallel(ssarr)){
        result ~= fish(el, 256) * count(arr, el);
        writeln("Element ", el," finished");
    }
    writeln(result);
    writeln(result.sum());
}
