import std.stdio;
import std.range;

void main()
{
    File file = File("input.txt", "r");
    bool sms, twit;

    ulong charge;

    foreach (line; file.byLine)
    {
        sms = true;
        twit = true;

        if (line.length > 160)
            sms = false;
        if (line.walkLength > 140)
            twit = false;

        if (sms && twit)
            charge += 13;
        else if (sms)
            charge += 11;
        else if (twit)
            charge += 7;
    }
    writeln(charge);
}
