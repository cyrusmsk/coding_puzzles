import std;

void main()
{
    int t;
    scanf("%d\n", &t);
    foreach(_; 0..t) {
        int n, x, y;
        scanf("%d %d %d\n", &n, &x, &y);
        if (min(x,y) != 0) {
            writeln(-1);
            continue;
        }
        else {
            int r = max(x,y);
            if (r == 0) {
                write(-1);
            }
            else if (r == 1)
                foreach(i; 0 .. n - 1)
                    write(i + 2, " ");
            else if (r == n - 1)
                foreach(i; 0 .. n - 1)
                    write("1 ");
            else {
                if ((n - 1) % r == 0) {
                    int l = 1;
                    int count = 0;
                    foreach(i; 2 .. n + 1) {
                        if (count == r) {
                            count = 0;
                            l = i;
                        }
                        write(l, " ");
                        count++;
                    }
                }
                else
                    write(-1);
            }
        }
        writeln();
    }       
}
