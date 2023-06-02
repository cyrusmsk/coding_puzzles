import std;

void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    foreach(_; 0..t)
    {
        long[] nums = readln.strip.split(" ").to!(long[]);
        nums.sort();
        if (nums[2] - nums[1] == nums[0])
            writeln("YES");
        else if ((nums[0] == nums[1]) && (nums[2] % 2 == 0))
            writeln("YES");
        else if ((nums[1] == nums[2]) && (nums[0] % 2 == 0))
            writeln("YES");
        else
            writeln("NO");
    }
}
