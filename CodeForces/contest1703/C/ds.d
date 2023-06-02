import std;

int t,n;

int U(int cur) {
    return cur == 9 ? 0 : cur + 1;
}

int D(int cur) {
    return cur == 0 ? 9 : cur - 1;
}

void main()
{
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        scanf("%d", &n);
        getchar();
        auto fin = readln.split.to!(int[]);
        foreach (w; 0 .. n) {
            auto l = readln.split.to!(string[]);
            foreach (com; l[1].array.reverse)
                if (com == 'U')
                    fin[w] = D(fin[w]);
                else
                    fin[w] = U(fin[w]);
        }
        writefln("%(%s %)", fin);
    }
    
}
