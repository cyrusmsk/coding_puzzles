import std;

enum b = "Burenka";
enum t = "Tonya";

void main()
{
    int w;
    scanf("%d", &w);
    getchar();
    foreach(_; 0..w)
    {
        long n,m;
        scanf("%lld %lld\n", &n, &m);
        if (n == 1)
            if (m % 2 == 0)
                writeln(b);
            else
                writeln(t);
        else if (m == 1)
            if (n % 2 == 0)
                writeln(b);
            else
                writeln(t);
        else {
            if ((n % 2 == 0) && (m % 2 != 0))
                writeln(b);
            else if ((n % 2 != 0) && (m % 2 == 0))
                writeln(b);
            else
                writeln(t);
        }
    }
}

