import std;

void main() {
     auto arr = stdin
         .byLineCopy
         .map!(e => e.replace(" -> "," ").replace(","," ").split().to!(int[]))
         .array;
     int n;
     foreach(el; arr)
         n = max(n, el.maxElement);
     n++;
     auto buf = new int[n * n];
     auto field = buf.chunks(n);
     foreach (l; arr){
         if (l[0] == l[2]){ // col
             for (int k = min(l[3],l[1]); k <= max(l[1],l[3]); k++)
                 field[l[0]][k]++;
         }
         else if (l[1] == l[3]){ // row
             for (int k = min(l[0], l[2]); k <= max(l[0],l[2]); k++)
                 field[k][l[1]]++;
         }
         else{ // diag
             int row_delta, col_delta;
             if (l[0] < l[2])
                 row_delta = 1;
             else
                 row_delta = -1;
             if (l[1] < l[3])
                 col_delta = 1;
             else
                 col_delta = -1;
             bool check = true;
             for (int i = l[0], j = l[1]; check ; i = i + row_delta, j = j + col_delta) {
                 field[i][j]++;
                 if (i == l[2])
                     check = false;
             }
         }
     }
     auto updated_field = buf.filter!(a => a >= 2);
     writeln(updated_field.array.length);
}
