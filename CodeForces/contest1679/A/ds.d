import std;

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    long n;
    foreach(_; 0..t)
    {
        n = readln.strip.to!(long);
        long amin, amax;
        if (n % 2 != 0 || n < 4) {
            writeln(-1);
            continue;
        }
        else {
            if (n % 4 == 0)
                amax = n / 4;
            else {
                auto tmp = n;
                while (tmp > 0) {
                    amax++;
                    tmp -= 6;
                    if (tmp % 4 == 0) {
                        amax += tmp / 4;
                        break;
                    }
                }
            }
            if (n % 6 == 0)
                amin = n / 6;
            else {
                auto tmp2 = n;
                while (tmp2 > 0) {
                    amin++;
                    tmp2 -= 4;
                    if (tmp2 % 6 == 0) {
                        amin += tmp2 / 6;
                        break;
                    }
                }
            }
        writeln(max(1,amin)," ", amax);
        }
    }
}

