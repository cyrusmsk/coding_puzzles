import std;
import std.outbuffer: OutBuffer;

void main()
{
    int t;
    OutBuffer buf = new OutBuffer();
    scanf("%d", &t);
    getchar();
    outer: foreach(_; 0..t)
    {
        int n;
        scanf("%d", &n);
        getchar();
        auto s = readln.split.to!(int[]);
        bool[int] uni;
        uni[s[n-1]] = true;
        foreach(i; iota(n-2,-1,-1)) {
            if (uni.get(s[i], false)) {
                writeln(i + 1);
                continue outer;
            }
            uni[s[i]] = true;
        }
        writeln(0);
    }
}
