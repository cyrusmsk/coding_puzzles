import std;

void sim(int i, int n, int x, int y, ref int[] s) {
    if (i == n) {
        if ((x == 0) && (y == 0))
            s ~= 1;
        return;
    }
    else {
        if ((x == 0) && (y == 0) && (i != 0))
            return;
        else
                if ((x + y) % 2 == 0) {
                    sim(i+1,n,x + 1,y,s);
                    sim(i+1,n,x - 1,y,s);
                    sim(i+1,n,x,y + 1,s);
                }
                else {
                    sim(i+1,n,x + 1,y,s);
                    sim(i+1,n,x - 1,y,s);
                    sim(i+1,n,x,y - 1,s);
                }
    }
}

void main()
{
    double prob = 0.0;
    auto arr = iota(2, 21, 2).array;
    foreach(k; arr) {
        writeln("Processing ", k);
        int[] s;
        sim(0,k,0,0,s);
        writeln(s.length);
        prob += cast(double)s.length/cast(double)(3L^^k);
    }
    writeln(prob);
    writefln("%2.7f",1 - prob);
}
