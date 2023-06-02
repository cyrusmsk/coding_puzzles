import std;

int n, t;

void main() {
    scanf("%d\n", &t);
    outer: foreach(_;0..t) {
        scanf("%d\n", &n);
        auto arr = readln.split.to!(int[]);
        int l = cast(int) arr.length;
        for(int line = l + l - 1; line > 0; line--) {
            int start_col = max(0, line - l);
            int count_idx = min(line, min(l - start_col, l));
            for(int j = 0; j < count_idx; j++) {
                if (gcd(arr[min(l, line) - j - 1], arr[start_col]) == 1) {
                    writeln(min(l, line) - j + start_col  + 1);
                    continue outer;
                }
            }
        }
        writeln(-1);
    }
}
