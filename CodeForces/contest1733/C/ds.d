import std;

int t;

void main() {
    scanf("%d\n", &t);
    foreach(_;0..t) {
        int n;
        scanf("%d\n", &n);
        auto a = readln.split.to!(long[]);
        if(n==1) {
            writeln(0);
			continue;
		}
        auto vis = new long[n];
        writeln(n-1);
        writeln(1," ", n-1);
        foreach(i;2..n)
			if ((a[i]+a[1])%2) {
                writeln(1," ", i);
                vis[i]=1;
            }
        foreach(i;iota(n-1,1,-1))
			if(!vis[i])
                writeln(i," ",n);
    }

}
