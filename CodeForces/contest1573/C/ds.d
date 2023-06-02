import std.stdio, std.algorithm, std.array, std.typecons, std.string, std.conv;
 
void main()
{
    int t;
    scanf("%d", &t);
    foreach(_; 0..t)
    {
        int chapters;
        scanf("%d", &chapters);
        getchar();
        Tuple!(int, int[])[] need = new Tuple!(int, int[])[chapters];
        foreach(i; 0 .. chapters)
        {
            auto x = readln.split().to!(int[]);
            need[i][0] = x[0];
            need[i][1] ~= x[1 .. $];
        }
        uint[] understood;
        uint res;
        while()
        {

        }
    }
}