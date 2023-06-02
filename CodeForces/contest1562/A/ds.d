import std.stdio, std.conv, std.string, std.array, std.algorithm;

long maximalModulus(long left, long right) {
    if (right / 2 + 1 >= left) {
        return right % (right / 2 + 1);
    }
    else {
        long max = -1;
        long i = 1;
        long x = 1;
        while (x > max + 1) {
            x = ((right - 1) / i) + 1;
            debug{writeln("x=", x, "right&x=", right%x, "max=", max);}
            if (right%x > max) {
                max = right%x;
            }
            if (x < left) {
                return right % left;
            }
            ++i;
        }
        return max;
    }
}

// void find_mod(long left, long right)
// {
//     long max_current = 0;
//     long max_delimeter = 0;
//     for (long a = right; a >= left; a--)
//     {
//         for (long b = max(a - 1, a / 2 + 1); b >= left ; b--)
//         {
//             auto current = a % b;
//             max_current = max(max_current, current);
//             if (max_current == b - 1)
//             {
//                 writeln(max_current);
//                 debug{writeln("A",a," B",b);}
//                 return;
//             }
//         }
//     }
//     writeln(max_current);
//     return;
// }

void main()
{
    int n;
    long l, r;
    scanf("%d", &n);
    getchar();

    for (int k = 0; k < n; k++){
	    scanf("%ld %ld", &l, &r);
        getchar();
        // find_mod(l, r);
        writeln(maximalModulus(l, r));
    }
}
