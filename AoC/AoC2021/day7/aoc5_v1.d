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
         if (l[1] == l[3]){ // row
             for (int k = min(l[0], l[2]); k <= max(l[0],l[2]); k++)
                 field[k][l[1]]++;
         }
     }
     auto updated_field = buf.filter!(a => a >= 2);
     writeln(updated_field.array.length);
}
