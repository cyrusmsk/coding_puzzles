import std.stdio, std.algorithm, std.array, std.string, std.conv;
 
void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        long a,b,c;
        scanf("%lld %lld %lld\n", &a, &b, &c);
        writeln(max(0, max(b,c) - a + 1), ' ', max(0, max(a,c) - b + 1), ' ', max(0, max(a,b) - c + 1));
    }
}