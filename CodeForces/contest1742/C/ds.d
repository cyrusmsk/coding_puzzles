import std;

int t;

void main() {
    scanf("%d\n", &t);
    foreach(_;0..t) {
        bool flag = false;
        foreach(k; 0..8){
            string row_s = readln.strip;
            char[] row = row_s.dup;
            if ((uniq(row).array.length == 1) && (row[0] == 'R')) {
                flag = true;
            }
        }
        readln;
        if (flag)
            writeln("R");
        else
            writeln("B");
    }
}
