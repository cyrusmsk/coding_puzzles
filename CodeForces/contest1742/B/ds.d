import std;

void main()
{
    int t;
    scanf("%d\n", &t);
    foreach(_; 0..t) {
        int n;
        scanf("%d\n", &n);
        auto arr = readln.split.to!(long[]);
        if (arr.length == 1)
            writeln("YES");
        else {
            if (arr.length == uniq(arr.sort).array.length)
                writeln("YES");
            else
                writeln("NO");
        }
    }       
}
