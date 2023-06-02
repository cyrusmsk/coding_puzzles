import std;

void main()
{
    int t;
    scanf("%d", &t);
    foreach(_; 0..t)
    {
        int n;
        scanf("%d", &n);
        int[] arr = [1];
        bool[int] set;
        set[1] = true;
        for (int i = 2; i <= n; i++) {
            for (int j = 0; i * 2 ^^ j <= n; j++)
                if ((i * 2 ^^ j in set) == null) {
                    arr ~= i * 2 ^^ j;
                    set[i * 2 ^^ j] = true;
                }
        }
        writeln(2);
        writefln("%(%s %)", arr);
    }
}
