import std;

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        string s = readln.strip;
        if (s.length == 2)
            writeln("Bob ", cast(int) s[0] - cast(int) 'a' + 1);
        else
        {
            if (s.length % 2 == 0)
                writeln("Alice ", s.map!(x => cast(int) x - cast(int) 'a' + 1).sum);
            else
            {
                if (cast(int) s[0] >= cast(int) s[$ - 1])
                    writeln("Alice ", s[0 .. $ -1].map!(x => cast(int) x - cast(int) 'a' + 1).sum - cast(int) s[$ - 1] - 1 + cast(int) 'a');
                else
                    writeln("Alice ", s[1 .. $].map!(x => cast(int) x - cast(int) 'a' + 1).sum - cast(int) s[0] - 1 + cast(int) 'a');
            }
        }
    }
}
