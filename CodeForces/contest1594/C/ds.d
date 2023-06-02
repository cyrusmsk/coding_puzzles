import std.stdio, std.algorithm, std.array, std.typecons, std.string, std.conv;
 
void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        auto params = readln.split();
        int n = to!int(params[0]);
        string s = readln.strip();
        if (to!string(uniq(s)) == params[1]) {
            writeln(0);
            continue;
        }
        else {
            Nullable!(ulong) oneind;
            foreach(ind, el; s) {
                if ((el == to!char(params[1])) && (2*(ind + 1) > n))
                    oneind = ind;
            }
            if (!oneind.isNull) {
                writeln(1);
                writeln(oneind + 1);
            }
            else {
                writeln(2);
                writeln(n-1, ' ', n);
            }
        }
    }
}