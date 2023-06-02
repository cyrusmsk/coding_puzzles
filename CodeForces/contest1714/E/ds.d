import std;

int t,n;

int[] even = [1,2,4,8]; // 0
int[] odd  = [3,6,7,9]; // 1
int[] five = [0,5]; // 2

int checkCase(int a) {
    if (a < 10) {
        if (even.canFind(a))
            return 0;
        else if (odd.canFind(a))
            return 1;
        else if (five.canFind(a))
            return 2;
    }
    else {
        if (a % 10 == 1) {
            if (((a - a % 10) / 10) % 2 == 0)
                return 0;
            else
                return 1;
        }
        else if ((a % 10 == 0) || (a % 10 == 5)) {
            return 2;
        }
        else if ((a % 10 == 3) || (a % 10 == 7) || (a % 10 == 9)) {
            if (((a - a % 10) / 10) % 2 == 0)
                return 1;
            else
                return 0;
        }
        else if ((a % 10 == 2) || (a % 10 == 4) || (a % 10 == 8)) {
            if (((a - a % 10) / 10) % 2 == 0)
                return 0;
            else
                return 1;
        }
        else if (a % 10 == 6) {
            if (((a - a % 10) / 10) % 2 == 0)
                return 1;
            else
                return 0;
        }
    }
    return 0;
}

void main()
{
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        scanf("%d", &n);
        getchar();
        auto arr = readln.split.to!(int[]);
        if (n == 1)
            writeln("yes");
        else {
            auto initType = checkCase(arr[0]);
            bool isSame = true;
            foreach(i; 1..n)
                if (initType != checkCase(arr[i])) {
                    isSame = false;
                    break;
                }
            if (isSame) {
                if (initType == 2) {
                    auto tmp = arr.sort.uniq.array;
                    if ((tmp.length == 2) && (maxElement(tmp) - minElement(tmp) == 5) && (minElement(tmp) % 10 == 5))
                        writeln("yes");
                    else if (tmp.length == 1)
			writeln("yes");
		    else
                        writeln("no");
                }
                else
                    writeln("yes");
            }
            else
                writeln("no");
        }
    }
}
