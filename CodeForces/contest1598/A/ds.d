import std.stdio, std.algorithm, std.array, std.string, std.conv;
 
void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        int n;
        scanf("%d", &n);
        getchar();
        auto str1 = readln.strip();
        auto str2 = readln.strip();
        bool flag = true;
        for (int i = 0; i < n; i++)
        {
            if ((str1[i] == str2[i]) && (str1[i] == '1'))
            {
                writeln("NO");
                flag = false;
                break;
            }
        }
        if (flag)
            writeln("YES");
    }
}