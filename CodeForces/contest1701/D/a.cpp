#include <bits/stdc++.h>
#define int long long 
#define endl '\n'

using namespace std;

const int N = 5e5 + 7;
struct node{
    int l, r, id;
    bool operator < (const node &w) const
    {
        if(r == w.r)    return l > w.l;
        return r < w.r;
    }
}q[N];
int a[N];
int st[N], ans[N], f[N];

int find(int x)
{
    if(x == f[x])   return f[x];
    return f[x] = find(f[x]);
}

signed main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    int t;
    cin >> t;
    while(t--)
    {
        int n;
        cin >> n;
        for(int i = 1; i <= n; i++) st[i] = 0, f[i] = i;
        for(int i = 1; i <= n; i++) cin >> a[i];

        for(int i = 1; i <= n; i++)
        {
            if(a[i] == 0)   q[i] = {i + 1, n, i};
            else {
                q[i] = {i / (a[i] + 1) + 1, i / a[i], i};
            }
        }

        sort(q + 1, q + 1 + n);
        for(int i = 1; i<=n;i++)
            cout << q[i].l << endl;

        for(int i = 1; i <= n; i++)
        {
            int l = find(q[i].l);
            cout << "Found l:" << l << " " << q[i].l << endl;
            while(st[l])
            {
                f[l] = find(l + 1);
                l = find(q[i].l);
            }
            cout << "Final l:" << l << endl;
            ans[q[i].id] = l;
            st[l] = 1;
        }
        for(int i = 1; i <= n; i++) cout << ans[i] << " ";
        cout << endl;
    }

    return 0;
}

