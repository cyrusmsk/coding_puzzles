import std;
import core.stdc.stdio;

const int MAXN = 100005;

int n,q;

struct Bit
{
    int[MAXN] t;

    int lowbit(int x) {
        return x & (-x);
    }

    void update(int x, int k) {
        while (x <= n) {
            t[x] += k;
            x += lowbit(x);
        }
    }

    int ask(int x) {
        int res = 0;
        while (x > 0) {
            res += t[x];
            x -= lowbit(x);
        }
        return res;
    }

    int query(int l, int r) {
        return ask(r) - ask(l - 1);
    }
}

Bit bx, by;

int[MAXN] cntRows, cntCols;

void main()
{
    scanf("%d %d", &n, &q);
    getchar();
    outer: foreach(_; 0..q)
    {
        int op, x1, x2, y1, y2;
        scanf("%d ", &op);
        if (op == 3) {
            scanf("%d %d %d %d\n", &x1, &y1, &x2, &y2);
            if (bx.query(x1,x2) == x2 - x1 + 1 || by.query(y1, y2) == y2 - y1 + 1)
                printf("Yes\n");
            else
                printf("No\n");
        }
        else {
            scanf("%d %d\n", &x1, &y1);
            if (op == 1) {
                if (cntRows[x1]++ == 0)
                    bx.update(x1,1);
                if (cntCols[y1]++ == 0)
                    by.update(y1,1);
            }
            else if (op == 2) {
                if (cntRows[x1]-- == 1)
                    bx.update(x1,-1);
                if (cntCols[y1]-- == 1)
                    by.update(y1,-1);
            }
        }
    }
}
