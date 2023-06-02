import std.stdio, std.algorithm, std.array, std.string, std.conv;
 
void main()
{
    int t;
    scanf("%d", &t);
    foreach(_; 0..t)
    {
        int str_len;
        scanf("%d", &str_len);
        getchar();
        auto x = readln.split().to!(int[]);
        auto y = readln.split().to!(int[]);

        ulong min_res = int.max;

        for (int i = 0; i < min_res; i++)
        {
            for (int j = 0; j < min_res; j++)
            {
                if (x[i] < y[j])
                {
                    if (i + j < min_res)
                    {
                        min_res = i + j;
                        break;
                    }
                }
            }
        }
        writeln(min_res);
    }
}