import std;

void main() {
    auto arr = readln.strip.split(",").to!(int[]);
    for (int step = 0; step < 256; step++){
        arr[] -= 1;
        foreach(i, e; arr){
            if (e < 0){
                arr[i] = 6;
                arr ~= 8;
            }
        }
    }
    //writeln(arr);
    writeln(arr.length);
}
