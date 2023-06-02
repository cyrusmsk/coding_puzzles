import std.stdio, std.algorithm, std.array, std.string, std.conv;

void main()
{
    int t;
    scanf("%d", &t);

    getchar();
    foreach (_; 0 .. t)
    {
        int k, n;
        scanf("%d %d\n", &n, &k);
        auto arr = readln.split().to!(int[]);
        // writeln(arr);
        int[] n_arr = new int[arr.length];
        n_arr[] += n;
        arr[] = n_arr[] - arr[];
        // writeln(arr);
        arr.sort();
        auto sum = cumulativeFold!((a, b) => a + b)(arr, 0);
        long res;
        auto rr = sum.array;
        int i = 0;
        // writeln(rr);
        // writeln(n);
        while (rr[i] < n)
        {
            res++;
            i++;
        }
        writeln(res);
    }
}
