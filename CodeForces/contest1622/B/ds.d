import std;

void main()
{
  foreach (casenum ; 1 .. readln.strip.to!int + 1) {
    int n;
    readf!" %d "(n);
    auto a = readln.splitter.map!(to!int).array;
    auto s = readln.strip.split("").map!(to!int).array;
    auto ans = iota(n).map!(x => tuple(a[x], s[x], x)).array.sort!((x, y) => x[1] == y[1] ? x[0] < y[0] : x[1] < y[1], SwapStrategy.stable).map!(x => x[2]);
    auto ans2 = iota(n).array;
    foreach (i ; 0 .. n)
      ans2[ans[i]] = i + 1;
    writeln(ans);
    writeln(ans2.map!text.join(" "));
  }
}
