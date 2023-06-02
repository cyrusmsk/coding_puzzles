import std;

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    outer: foreach(_; 0..t)
    {
        string s = readln.strip;
        auto u = s.array.sort.uniq.array;
        int ul = cast(int) u.length;
        if (ul == 1)
        {
            writeln("yes");
            continue outer;
        }
        int[] zeros = new int[ul];
        auto tmp = assocArray(zip(u, zeros));
        foreach(int ind, ch; s.array)
        {
            if (tmp[ch] == 0)
            {
                tmp[ch] = ind + 1;
                continue;
            }
            if ((ind + 1) - tmp[ch] < ul)
            {
                writeln("no");
                continue outer;
            }
            tmp[ch] = ind + 1;
        }
        writeln("yes");
    }
}
