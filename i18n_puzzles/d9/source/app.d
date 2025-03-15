import std.stdio : writeln, File, readln;
import std.format : formattedRead;
import std.algorithm;
import std.datetime;
import std.conv;
import std.string;
import std.typecons;

import dateparser;

SysTime apply_rule(string input, string type) {
    SysTime res;
    string new_input;
    if (type == "DMY") { // UK
        if (input[6..$] == "00")
            new_input = input[0..6] ~ "01";
        else
            new_input = input;
        res = parse(new_input, Yes.ignoreTimezone, null, Yes.dayFirst, No.yearFirst);
        if (input[0..2] == "00")
            res.roll!"years"(-1);
        if ((res.day!= input[0..2].to!int) && (res.year != input[6..$].to!int))
            throw new Exception("msg");
        else
            return res;
    }
    else if (type == "MDY") { // US
        if (input[6..$] == "00")
            new_input = input[0..6] ~ "01";
        else
            new_input = input;
        res = parse(new_input, Yes.ignoreTimezone, null, No.dayFirst, No.yearFirst);
        if (input[0..2] == "00")
            res.roll!"years"(-1);
        if ((res.month!= input[0..2].to!int) && (res.year != input[6..$].to!int))
            throw new Exception("msg");
        else
            return res;
    }
    else if (type == "YMD") { // Japan
        if (input[0..2] == "00")
            new_input = "01" ~ input[2..$];
        else
            new_input = input;
        res = parse(new_input, Yes.ignoreTimezone, null, No.dayFirst, Yes.yearFirst);
        if (input[0..2] == "00")
            res.roll!"years"(-1);
        if ((res.month!= input[3..5].to!int) && (res.year != input[0..2].to!int))
            throw new Exception("msg");
        else {
            return res;
        }
    }
    else if (type == "YDM") { // Other
        string rev_input = input[0..2] ~ input[5..$] ~ input[2..5];
        if (input[0..2] == "00")
            new_input = "01" ~ rev_input[2..$];
        else
            new_input = rev_input;
        res = parse(new_input, Yes.ignoreTimezone, null, No.dayFirst, Yes.yearFirst);
        if (input[0..2] == "00")
            res.roll!"years"(-1);
        if ((res.day != input[3..5].to!int) && (res.year != input[0..2].to!int)) 
            throw new Exception("msg");
        else
            return res;
    }
    else
        return parse(input);
}
void main()
{
    File file = File("input.txt", "r");

    string[][string] dict;
    string date, authors_list;
    string[] result;

    foreach(line; file.byLine())
    {
        line.formattedRead("%s: %s", date, authors_list);
        string[] authors = authors_list.strip.split(",");
        foreach(author; authors)
            dict[strip(author)] ~= date;
    }

    SysTime x;
author_flag: foreach(k, v; dict) {
        type_flag: foreach(type; ["DMY", "MDY", "YMD", "YDM"]) {
            Date[] dates;
            try {
                foreach(date; v) {
                    x = apply_rule(date, type);
                    auto y = cast(Date) x;
                    auto z = y;
                    z.roll!"years"(-100);
                    if ((y > Date(1920,1,1)) && (y < Date(2020,1,1))) {
                        dates ~= y;
                    }
                    else if ((z > Date(1920,1,1)) && (z < Date(2020,1,1))) {
                        dates ~= z;
                    }
                    else {
                        continue type_flag;
                    }
                }
            }
            catch (Exception e) {
                continue type_flag;
            }
            catch (Error e) {
                continue type_flag;
            }
            if (canFind(dates, Date(2001,9,11)))
                result ~= k;
            continue author_flag;
        }
    }
    writeln(result.sort.uniq.join(" "));
}
