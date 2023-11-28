import std;

void main() {
    int n = 2000;
    int k;
    int[2000] arr;
    foreach(idx; 0..n) {
        scanf("%d\n", &k);
        arr[idx] = k;
    }
    int res1, res2;
    // first part
    for (int i = 1; i < arr.length; i++)
        if (arr[i] > arr[i - 1])
            res1++;

    // second part
       int[] arr3;
    for (int i = 0; i <= n - 3; i++)
        arr3 ~= arr[i] + arr[i + 1] + arr[i + 2];
    for (int j = 1; j < arr3.length; j++)
        if (arr3[j] > arr3[j - 1])
            res2++;
    writeln(res1,' ', res2);
}
