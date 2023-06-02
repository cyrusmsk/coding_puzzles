import std;

void main()
{
    int w;
    scanf("%d\n", &w);
    foreach(_; 0..w)
    {
        int a,b,c;
        scanf("%d %d %d\n", &a, &b, &c);
        int max_el = max(a,b,c);
        if (a+b+c - max_el == max_el)
            writeln("YES");
        else
            writeln("NO");
    }
}
