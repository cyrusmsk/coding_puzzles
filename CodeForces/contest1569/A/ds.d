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
        auto str = readln.strip();
        // writeln(str);
        int[] check = new int[str_len];
        bool flag = true;
        for(int i = 0; i < str_len; i++)
        {
            if (flag == false)
                break;
            if (str[i] == 'a')
            {
                for (int j = i; j >= 0; j--)
                {
                    check[j] += 1;
                    if (check[j] == 0)
                    {
                        writeln(j + 1,' ', i + 1);
                        flag = false;
                    }
                }
            }
            else
            {
                for (int j = i; j >= 0; j--)
                {
                    check[j] -= 1;
                    if (check[j] == 0)
                    {
                        writeln(j + 1,' ', i + 1);
                        flag = false;
                    }
                }
            }
        }
        if (flag)
            writeln("-1 -1");
    }
}