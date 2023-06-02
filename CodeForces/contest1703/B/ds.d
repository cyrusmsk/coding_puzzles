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
        long res;
        auto s = readln.strip.to!(char[]);
        bool[char] solved;
        foreach(p; s) {
            auto tmp = (p in solved);
            if (tmp is null) {
                res += 2;
                solved[p] = true;
            }
            else {
                res += 1;
            }
        }
        writeln(res);
    }
}
