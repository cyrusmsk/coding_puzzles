import std;

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    long n;
    foreach(_; 0..t)
    {
        auto row1 = readln.split.to!(int[]);
        auto row2 = readln.split.to!(int[]);

        if (sum(row1) == 0 && sum(row2) == 0)
            writeln(0);
        else if (sum(row1) + sum(row2) == 4)
            writeln(2);
        else
            writeln(1);
    }
}

