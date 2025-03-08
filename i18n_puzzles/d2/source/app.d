import std;
import dateparser; 

void main() { 
    File file = File("input.txt", "r");
    int[SysTime] counter;

    foreach(time_frame; file.byLine()) {
        auto st = parse(time_frame);
        auto utc_st = st.toUTC();
        if (auto count = utc_st in counter)
            *count += 1;
        else
            counter[utc_st] = 1;
    }
    foreach(utc_date, cnt; counter)
        if (cnt >= 4)
            writeln(parse(utc_date.toString()).toISOExtString(),"+00:00");
}
