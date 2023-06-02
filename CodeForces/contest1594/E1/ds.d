import std.stdio, std.algorithm, std.array, std.math, std.typecons, std.bigint, std.conv;
 
void main()
{
    int k;
    scanf("%d", &k);
    long res1 = 2UL^^k - 2;
    BigInt n = 4;
    BigInt res2 = powmod(n, to!BigInt(res1), to!BigInt(10^^9 + 7));
    
    writeln((res2 * to!BigInt(6)) % (10^^9 + 7));
}