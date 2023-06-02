import std;

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        long n, k;
        scanf("%ld %ld", &n, &k);
        getchar();
        long[] a = iota(n).array;
        bool flag = false;
        do
        {
            long summ;
            for(int i = 0; i < n; i = i + 2)
            {
                summ += a[i] & a[i + 1];
                if (summ > k) {
                    break;
                }
            }
            if (summ == k) {
                flag = true;
                break;
            }
        } while (nextPermutation(a));
        if (flag)
            for(int j = 0; j < n; j = j + 2)
                writeln(a[j], " ", a[j + 1]);
        else
            writeln(-1);
    }       
}