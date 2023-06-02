import std;

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    outer: foreach(_; 0..t)
    {
        long n, k;
        long[][] answer;
        scanf("%lld %lld\n", &n, &k);
        if ((k == 0) || (k % 4 == 0)) {
            writeln("NO");
            continue;
        }
        if (n == 2) {
            if (k % 2 != 0) {
                writeln("YES");
                writeln(1," ", 2);
            }
            else if (k % 4 == 0)
                writeln("NO");
            else if (k % 4 != 0) {
                writeln("YES");
                writeln(2, " ", 1);
            }
            else
                writeln("NO");
            continue;
        }
        foreach(i; iota(2,n+1,2)) {
            if ((i+k) % 4 == 0)
                answer ~= [i, i-1];
            else
                answer ~= [i-1, i];
        }
        writeln("YES");
        foreach(row; answer)
            writefln("%(%s %)", row);
    }
}
