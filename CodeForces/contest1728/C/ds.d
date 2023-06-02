import std;

int t;
uint n;

void main()
{
    scanf("%d\n", &t);
    foreach(_; 0..t)
    {
        scanf("%ud\n", &n);
        long result;
        long tmp;
        long[] a = new long[n];
        long[] b = new long[n];
        foreach(id; 0 .. n){
            scanf("%lld", &tmp);
            getchar();
            a[id] = tmp;
        }
        foreach(id; 0 .. n){
            scanf("%lld", &tmp);
            getchar();
            b[id] = tmp;
        }

        a.sort!("a < b");
        b.sort!("a < b");

        auto diffA = setDifference(a, b).array;
        auto diffB = setDifference(b, a).array;
        if (diffA.length == 0) {
            writeln(0);
            continue;
        }
        foreach(ref e; diffA) {
            long l = cast(long) to!string(e).length;
            if (l > 1) {
                e = l;
                result++;
            }
        }
        foreach(ref e; diffB) {
            long l = cast(long) to!string(e).length;
            if (l > 1) {
                e = l;
                result++;
            }
        }
        auto diff2 = setSymmetricDifference(sort(diffA), sort(diffB)).array;
        auto r = diff2.filter!(a => a > 1).array;
        result += r.length;
        
        writeln(result);
    }
    
}