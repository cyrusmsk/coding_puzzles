import std;

const int N = 1_000_101;

int n, c;
int[N] a, ex, s;

// char buf[1 << 25], *p1 = buf, *p2 = buf;
// #define getchar() (p1 == p2 && (p2 = (p1 = buf) + fread(buf,1,1 << 21,stdin),p1 == p2) ? EOF : *p1++)

int read() {
    int x = 0, f = 1;
    auto ch = getchar();
    while(ch > '9' || ch < '0') { if(ch == '-') f = -1; ch = getchar(); }
    while(ch >= '0' && ch <= '9') x = x * 10 + ch - 48, ch = getchar();
    return x * f;
}

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    outer: foreach(_; 0..t)
    {
        n = read(), c = read();
        for(int i = 1;i <= c;i++) ex[i] = false;
        for(int i = 1;i <= n;i++) a[i] = read(), ex[a[i]] = true;
        for(int i = 1;i <= c;i++) s[i] = s[i - 1] + ex[i];
        for(int k = 1;k <= c;k++) if(!ex[k]) {
        for(int y = 1;k * y <= c;y++) if(ex[y]) {
            int l = k * y, r = min(c,(k + 1) * y - 1);
                if(s[r] - s[l - 1]) {
                    printf("No\n");
                    continue outer;
                }
            }
        }
        printf("Yes\n");
    }
}
