import std;

void main()
{
    int w;
    scanf("%d\n", &w);
    foreach(_; 0..w)
    {
        int n,k;
        scanf("%d %d\n", &n, &k);
        auto a = readln.split.to!(long[]);
        if (n == k) {
            writeln(a.sum);
            continue;
        }
        long[] res = new long[k];
        foreach(i; 0 .. n)
            if (res[i % k] < a[i])
                res[i % k] = a[i];
        writeln(res.sum);        
    }
}

