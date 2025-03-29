import std.stdio : lines, writeln, File;
import std.range;
import std.uni;
import std.algorithm;
import std.string;
import std.array;
import std.conv;
import std.format;
import std.typecons;

alias record = Tuple!(string, string,string,int);

alias sort_a = (a, b) => a_sort(a,b);
alias sort_b = (a, b) => b_sort(a,b);
alias sort_c = (a, b) => c_sort(a,b);

void key_a(record[] book) {
    foreach(ref r; book)
        r[0] = r[1] ~ r[2];
}

bool a_sort(record a, record b)
{
    return normalize!NFC(a[0]) < normalize!NFC(b[0]);
}

void main()
{
    File file = File("test.txt", "r");

    int result;
    string sn, fn;
    int phone;

    record[] book;
    foreach (string line; lines(file)) {
        line.formattedRead("%s, %s: %d", sn, fn, phone);
        book ~= tuple("", sn,fn,phone);
    }

    key_a(book);
    book.sort!sort_a;
    foreach(r; book)
        writeln(r[0], ":", r[1], ",", r[2]);
}
