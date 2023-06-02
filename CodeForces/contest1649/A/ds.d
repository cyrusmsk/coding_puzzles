import std;

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        int k;
        scanf("%d\n", &k);
        int[] s = readln.strip.split.to!(int[]);
        auto end = countUntil(retro(s), 0);
        auto start = countUntil(s, 0);
        if (start == -1)
            writeln(0);
        else
            writeln(k - start - end + 1);
    }
}
