import std;

void main()
{
    long a, b, c;
    scanf("%lld", &a);
    getchar();
    readf!" %d"(c);
    getchar();
    b = readln.strip.to!(long);
    writeln(a);
    writeln(b);
    writeln(c);
}