import std;

int oxy(string[][] arr)
{
    auto arr_local = arr;
    int bit_num = 0;
    string current_popular_bit;
    while(arr_local.length > 1) {
        int tmp;
        for (int i = 0; i < arr_local.length; i++)
            tmp += to!int(arr_local[i][0][bit_num] - '0');
        if (tmp < arr_local.length/2.)
            current_popular_bit = "0";
        else
            current_popular_bit = "1";
        string[][] arr_tmp;
        foreach (e; arr_local)
            if (to!string(e[0][bit_num]) == current_popular_bit)
                arr_tmp ~= e;
        arr_local = arr_tmp;
        bit_num = (bit_num + 1) % (cast(int) arr_local[0][0].length);
    }
    return arr_local[0][0].to!int(2);
}

int co2(string[][] arr)
{
    auto arr_local = arr;
    int bit_num = 0;
    string current_popular_bit;
    while(arr_local.length > 1) {
        int tmp;
        for (int i = 0; i < arr_local.length; i++)
            tmp += to!int(arr_local[i][0][bit_num] - '0');
        if (tmp < arr_local.length/2.)
            current_popular_bit = "1";
        else
            current_popular_bit = "0";
        string[][] arr_tmp;
        foreach (e; arr_local)
            if (to!string(e[0][bit_num]) == current_popular_bit)
                arr_tmp ~= e;
        arr_local = arr_tmp;
        bit_num = (bit_num + 1) % (cast(int) arr_local[0][0].length);
    }
    return arr_local[0][0].to!int(2);
}
void main() {
    auto arr = stdin
        .byLineCopy
        .map!(e => e.strip.split())
        .array;
    writeln(co2(arr)*oxy(arr));
}
