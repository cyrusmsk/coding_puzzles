import std;
import dateparser;

long get_diff_dst(SysTime t) {
    return t.utcOffset.total!"hours";
}

void main()
{
    File file = File("input.txt", "r");

    auto halif_tz = PosixTimeZone.getTimeZone("America/Halifax");
    auto santg_tz = PosixTimeZone.getTimeZone("America/Santiago");

    long result;
    long i;
    SysTime res_time;

    foreach (line; file.byLine)
    {
        i++;
        auto s = line.split;
        string time = s[0].to!string;
        int cor_min = s[1].to!int;
        int incor_min = s[2].to!int;

        auto ptime = parse(time);
        auto df = ptime - incor_min.minutes + cor_min.minutes;

        auto hdf = ptime.toOtherTZ(halif_tz);
        auto sdf = ptime.toOtherTZ(santg_tz);

        if (get_diff_dst(ptime) == get_diff_dst(hdf))
            res_time = df.toOtherTZ(halif_tz);
        else 
            res_time = df.toOtherTZ(santg_tz);

        result += i * res_time.hour;
    }
    writeln("Result:", result);
}
