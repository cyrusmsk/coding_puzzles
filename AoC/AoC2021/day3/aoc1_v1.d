import std;

void main() {
    auto arr = stdin
        .byLineCopy
        .map!(e => e.strip.split())
        .array;
    int n = cast(int) arr.length;
    int l = cast(int) arr[0][0].length;
    int[] ones = new int[l];

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < l; j++) {
            ones[j] += to!int(arr[i][0][j] - '0');
        }
    }

    string[] gamma = new string[l];
    string[] eps = new string[l];
    foreach(i, x; ones) {
        if (x > n/2) {
            gamma[i] = "1";
            eps[i] = "0";
        }
        else {
            gamma[i] = "0";
            eps[i] = "1";
        }
    }
    writeln(gamma.join().to!int(2) * eps.join().to!int(2));
}
