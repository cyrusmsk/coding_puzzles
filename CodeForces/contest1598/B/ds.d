import std.stdio, std.algorithm, std.array, std.string, std.format, std.range, std.bigint, std.conv;
 


void main()
{
    int t;
    scanf("%d", &t);
    foreach(_; 0..t)
    {
        int n;
        scanf("%d", &n);
        getchar();
        int[] carr = new int[n];
        for (int k = 0; k < n; k++)
            carr[k] = k;
        int[][5] a;
        for (int k=0; k < n; k++)
        {
            auto tmp = readln.split().to!(int[]);
            for (int z = 0; z < 5; z++)
            {
                if (tmp[z] == 1)
                    a[z] ~= k;
            }
        }
        // writeln(a);
        bool flag = false;
        outer: for (int x = 0; x < 5; x++)
        {
            for (int z = x + 1; z < 5; z++)
            {
                // writeln("X:",x," Z:", z);
                auto tmp = (a[x] ~ a[z]);
                // writeln(tmp);
                tmp.sort();
                if ((a[x].length >= n / 2) && (a[z].length >= n / 2) && (equal(uniq(tmp), carr[])))
                {
                    writeln("YES");
                    flag = true;
                    break outer;
                }
                // writeln((uniq(a[x] ~a[z])));
            }
        }
        if (!flag)
            writeln("NO");
    }
}