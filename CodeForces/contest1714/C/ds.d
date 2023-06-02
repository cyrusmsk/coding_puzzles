import std;

int t, n;

void main()
{
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        scanf("%d", &n);
        getchar();
        int[] ans;
        if (n > 9) {
            int i = 9;
            while(n > i) {
                n -= i;
                ans ~= i;
                i--;
            }
            ans ~= n;
            writefln("%(%s%)", ans.reverse);
        }
        else
            writeln(n);
    }
    
}
