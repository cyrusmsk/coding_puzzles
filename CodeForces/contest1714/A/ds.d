import std;


void main()
{
    int t;
    scanf("%d", &t);
    getchar();
    long n;
    foreach(_; 0..t)
    {
        auto s = readln.split.to!(int[]);
        TimeOfDay[] less;
        TimeOfDay[] more;
        int min_ind;
        foreach(i; 0..s[0]) {
            auto tmp = readln.split.to!(int[]);
            if ((tmp[0] < s[1]) || ((tmp[0] == s[1]) && (tmp[1] < s[2])))
                less ~= TimeOfDay(tmp[0],tmp[1]);
            else
                more ~= TimeOfDay(tmp[0],tmp[1]);
        }
        if (more.length > 0) {
            auto tmpMin = minElement(more) - TimeOfDay(s[1],s[2]);
            writeln(tmpMin.split.hours, " ", tmpMin.split.minutes);
        }
        else {
            auto tmpMin = minElement(less) + (TimeOfDay(0,0) - TimeOfDay(s[1],s[2]));
            writeln(tmpMin.hour, " ", tmpMin.minute);
        }
    }
}

