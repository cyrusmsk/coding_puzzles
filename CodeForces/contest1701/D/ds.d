import std;

int t,n;
uint k;
static const uint N = 500007;

struct node {
    uint l, r, id;
    int opCmp(ref const node rhs) const {
        if (r == rhs.r)
            return l > rhs.l ? -1 : 1;
        return r < rhs.r ? -1 : 1;
    }
}

node[N] q;
uint[N] a, ans, f;
bool[N] st;

uint find(uint x) {
    if (x == f[x])
        return f[x];
    return f[x] = find(f[x]);
}

void main()
{
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        scanf("%d", &n);
        getchar();
        foreach(i; 1 .. (n + 1)) {
            f[i] = i;
            st[i] = false;
            scanf("%u", &k);
            a[i] = k;
        }
        foreach(i; 1 .. (n + 1)) {
            if (a[i] == 0)
                q[i] = node(i+1,n,i);
            else
                q[i] = node(i/(a[i]+1)+1,i/a[i],i);
        }
        sort!"a < b"(q[1..n+1]).array;
        foreach(i;1 .. (n + 1)) {
            uint l = find(q[i].l);
            while(st[l]) {
                f[l] = find(l + 1);
                l = find(q[i].l);
            }
            ans[q[i].id] = l;
            st[l] = true;
        }
        writefln("%(%s %)", ans[1..n+1]);
    }
}
