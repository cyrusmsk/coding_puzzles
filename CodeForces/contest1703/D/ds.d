import std;

int t,n;

void main()
{
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        scanf("%d", &n);
        getchar();
        string[] arr = new string[](n);
        bool[] ans = new bool[](n);
        bool[string] test;
        
        foreach(k; 0 .. n) {
            auto tmp = readln.strip;
            arr[k] = tmp;
            test[tmp] = false;
        }
        
        outer: for(int i = 0; i < n; i++) {
            if (test[arr[i]]) {
                ans[i] = 1;
                continue;
            }
            bool found = false;
            for(int l = 1; l < arr[i].length; l++)
                if ((arr[i][0..l] in test) && (arr[i][l..$] in test)) {
                        test[arr[i]] = true;
                        ans[i] = 1;
                        continue outer;
                }
        }
        writefln("%(%d%)", ans);
    }
}
