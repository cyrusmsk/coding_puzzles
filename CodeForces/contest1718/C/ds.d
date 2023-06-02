import std;

int t, n, q, i;
long k;

void main()
{
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        scanf("%d %d\n", &n, &q);
        int[int] d;
        int[] a = readln.split.to!(int[]);
        foreach(id, el;a){
            d[el] = id;
        }
        foreach(v; 0 .. q) {
            scanf("%d %lld\n", &i, &k);
            i--;
            if (k < i) {
                writeln(0);
                continue;
            }
            else {
                int j = 0;
                long resTours;
                if (i == 0) {
                    resTours = k;
                }
                else {
                    int prevMax = maxElement(a[0..i]);
                    if (a[i] < prevMax) {
                        writeln(0);
                        continue;
                    }
                    j = 1;
                    resTours = k - i;
                }
                if (a[i] == n) {
                    writeln(resTours + j);
                    continue;
                }
                int r = 0;
                while(resTours-- > 0) {
                    if (a[i] > a[i + r + 1])
                        r++;
                    else
                        break;
                }
                writeln(r + j);
            }
        }
    }
    
}
