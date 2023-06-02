import std.stdio, std.algorithm, std.array, std.string, std.conv;
 
void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        auto str = readln.strip;
        int zero_cnt, five_cnt;
        bool zero_f = false, five_f = false;
        for(int i = cast (int) str.length - 1; i > 0; i--)
        {
            if (str[i] == '0')
            {
                int j = i - 1;
                while((str[j] != '0') && (str[j] != '5') && (!zero_f))
                {
                    zero_cnt++;
                    j--;
                    if (j == -1)
                        break;
                }
                if (j >= 0)
                    zero_f = true;
                if (!five_f)
                    five_cnt++;
            }
            else if (str[i] == '5')
            {
                int j = i - 1;
                while((str[j] != '2') && (str[j] != '7') && (!five_f))
                {
                    five_cnt++;
                    j--;
                    if (j == -1)
                        break;
                    
                }
                if (j >= 0)
                    five_f = true;
                if (!zero_f)
                    zero_cnt++;
            }
            else
            {
                if (!zero_f)
                    zero_cnt++;
                if (!five_f)
                    five_cnt++;
            }
        }
        writeln(min(zero_cnt, five_cnt));
    }
}