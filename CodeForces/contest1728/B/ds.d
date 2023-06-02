import std;

void main()
{
    int t;
    scanf("%d\n", &t);
    foreach(_; 0..t) {
        int n;
        scanf("%d\n", &n);
        int[] res = new int[n];
        res[n-1] = n;
        res[n-2] = n - 1;

        int j = 0;
        if (n % 2 == 0)
            foreach(i; iota(n-2,0,-1))
                res[j++] = i;
        else {
            ++j;
            res[0] = 1;
            foreach(i; iota(n-2,1,-1))
                res[j++] = i;
        }
        
        writefln("%(%s %)", res);
    }
    
        
}
