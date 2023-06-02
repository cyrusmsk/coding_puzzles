import std;

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        auto s = readln.strip;
        auto z = count(s, '0');
        auto o = s.length - z;
        if (z == 0 || o == 0)
            writeln(0);
        else if (o == z)
            if (s.length > 2)
                writeln(o - 1);
            else
                writeln(0);
        else
            writeln(min(o, z));
    }
}
