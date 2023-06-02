import std;

void main()
{
    int n, q;
    scanf("%d %d", &n, &q);
    getchar();
    long[] arr = readln.split.to!(long[]);
    long sum = arr.sum;
    long[long] xch;
    long def_value;
    bool not_rewrited = true;
    outer: foreach(_; 0..q)
    {
        long[] query = readln.split.to!(long[]);
        if (query[0] == 1) {
            if (not_rewrited)
                sum += query[2] - xch.get(query[1], arr[cast(size_t)query[1] - 1]);
            else
                sum += query[2] - xch.get(query[1], def_value);
            xch[query[1]] = query[2];
        }
        else {
            not_rewrited = false;
            sum = n * query[1];
            def_value = query[1];
            xch.clear;
        }
        writeln(sum);
    }
}
