import std.stdio, std.algorithm, std.array, std.typecons, std.string, std.math, std.conv;
 
void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        int n;
        scanf("%d\n", &n);

        int[] arr = readln.strip.split.to!(int[]);
        // writeln("Arr=",arr);
        const auto val = 2 * arr.mean;
        long res = 0L;
        if (ceil(val) != val) {
            writeln(0);
            continue;
        }
        else {
            for (int i = 0; i < n; i++)
            {
                for (int j = i + 1; j < n; j++)
                {
                    if (j < n)
                        if (arr[i] + arr[j] == val)
                        {
                            res++;
                        } 
                }
            }
            writeln(res);
        }
    }
}