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
        long[] a = readln.strip.split(" ").to!(long[]);
        long[] b = readln.strip.split(" ").to!(long[]);
        foreach (i; 0..n)
        {
            if (a[i] < b[i])
                swap(a[i], b[i]);
        }
        writeln(maxElement(a)*maxElement(b));
    }
}
