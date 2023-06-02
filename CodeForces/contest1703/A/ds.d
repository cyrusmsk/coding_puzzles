import std;


void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    long n;
    foreach(_; 0..t)
    {
        auto s = readln.strip.toLower();
        if (s == "yes")
            writeln("YES");
        else
            writeln("NO");
    }
}

