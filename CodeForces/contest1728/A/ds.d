import std;

void main()
{
    int w;
    scanf("%d\n", &w);
    foreach(_; 0..w)
    {
        int n;
        scanf("%d\n", &n);
        auto a = readln.split.to!(int[]);
        writeln(maxIndex(a) + 1);
    }
}

