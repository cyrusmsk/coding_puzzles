import std;

int n, t, q;

void main() {
    scanf("%d\n", &t);
    foreach(_;0..t) {
        scanf("%d %d\n", &n, &q);
        long[] h = new long[](n);
        auto rbt = redBlackTree!long;
        long[long] idx;
        long cur, prev, maxv;
        foreach(i; 0..n) {
            scanf("%lld", &cur);
            h[i] = cur + prev;
            prev = h[i];
            if (cur > maxv) {
                idx[cur] = i + 1;
                if (maxv)
                    idx[maxv] = i;
                rbt.insert(cur);
                maxv = cur;
            }
        }
        getchar();
        auto quieries = readln.split.to!(long[]);

        writeln(h);
        writeln(idx);
        writeln(rbt);
        foreach(query; quieries) {
            writeln(rbt.lowerBound(query));
        }      
    }
}
