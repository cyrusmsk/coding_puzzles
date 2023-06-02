import std;

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
        auto d = n % 7;
        if (d == 0)
            writeln(n);
        else {
            int m = n % 10;
            if (m >= d)
                writeln(n - d);
            else {
                writeln(n + 7 - (n+7) % 7);
            }
        }
    }
}
