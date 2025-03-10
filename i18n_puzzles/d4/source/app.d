import std.stdio : writeln, File, readln;
import std.format : formattedRead;
import std.datetime;
import dateparser;

SysTime combine_timezone(string time, string tz)
{
    auto st = parse(time);
    auto y = SysTime(cast(DateTime)st,
        PosixTimeZone.getTimeZone(tz));
    return y;
}

void main()
{
    File file = File("input.txt", "r");

    string dep, arr, dep_time, arr_time;

    int result;
    while (!file.eof)
    {
        file.readln.formattedRead("Departure: %s %s\n", dep, dep_time);
        file.readln.formattedRead("Arrival: %s %s\n", arr, arr_time);

        auto x = combine_timezone(dep_time, dep);
        auto y = combine_timezone(arr_time, arr);

        auto inter = y - x;
        result += inter.total!"minutes";

        file.readln();
        if (file.eof)
            break;
    }
    writeln("Result:", result);
}
