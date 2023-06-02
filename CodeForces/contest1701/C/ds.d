import std;

int t,n,m;
long[] answers;

void main()
{
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        scanf("%d %d", &n, &m);
        getchar();
        auto arr = readln.split.to!(int[]);
        int[] w = new int[](n);
        foreach (k; arr)
            w[--k]++;
        w.sort.reverse.array;
        auto ans = maxElement(w);
        long l = 0;
        long r = ans;
        while (r - l != 1) {
            long mid = (l + r) / 2;
            long rem = 0;

            foreach (i; 0 .. n)
                if (w[i] > mid)
                    rem += w[i] - mid;
                else
                    rem -= (mid - w[i]) / 2;
            
            if (rem <= 0)
                r = mid;
            else
                l = mid;
        }
        answers ~= r;
    }
    writefln("%(%s \n%)", answers);
}
