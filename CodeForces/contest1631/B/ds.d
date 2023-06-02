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
        int[] a = readln.strip.split(" ").to!(int[]);
        int res = 0;
        while (a.uniq.array.length != 1)
        {
            // writeln(a);
            // writeln("len = ", a.uniq.array.length);
            int left_pad;
            int indx;
            for(int i = n - 1; i >= 0; i--)
            {
                if (a[i] == a[n-1])
                    left_pad++;
                else
                {
                    indx = i;
                    break;
                }
            }
            if (indx - left_pad + 1 > 0)
            {
                // writeln("changing from", indx - left_pad + 1, " to ", indx + 1);
                a[indx - left_pad + 1 .. indx + 1] = a[n - 1];
            }
            else
            {
                a[0 .. indx + 1] = a[n - 1];
            }
            res++;
        }
        writeln(res);
    }
}
