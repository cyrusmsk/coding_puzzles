import std.stdio, std.algorithm, std.array, std.string, std.conv;
 
void main()
{
    int t;
    scanf("%d", &t);
    foreach(_; 0..t)
    {
        long n;
        scanf("%lld", &n);
        getchar();
        writeln(-1 * (n - 1), ' ', n);
    }
}