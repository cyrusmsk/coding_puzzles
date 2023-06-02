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
        uint[] arr = new uint[str_len];
        
        for(int i = 0; i < str_len; i++)
        {
            arr[i] = to!uint(str[i..i + 1]);
        }
        auto zeros = new uint[str_len];
        long res = 0;
        int last_non_null = str_len - 1;
        while (arr != zeros)
        {
            if (arr[last_non_null] == 0){
                last_non_null--;
            }
            else
            {
                if (last_non_null != str_len - 1)
                    res += 1;
                res += arr[last_non_null];
                arr[last_non_null] = 0;
                last_non_null--;
            }
        }
        writeln(res);
    }
}