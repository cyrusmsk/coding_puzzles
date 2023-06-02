import std.stdio, std.algorithm, std.array, std.string, std.format, std.range, std.bigint, std.conv;
 


void main()
{
    int t;
    scanf("%d", &t);
    foreach(_; 0..t)
    {
        long n, k;
        scanf("%lld %lld", &n, &k);
        getchar();
        auto s = format("%b", k);
        BigInt res;
        long i = 0;
        foreach(el; s.retro)
        {
            if (el == '1')
                res += n ^^ i % (10^^9 + 7);
            i++;
        }
        writeln(res % (10^^9 + 7));
    }
}