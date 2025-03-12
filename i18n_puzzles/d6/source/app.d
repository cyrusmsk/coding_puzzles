import std;
import std.uni : toLower;

void main()
{
    File file = File("input.txt", "r");

    Tuple!(string, long)[][ulong] dict;
    string[] reqs;
    bool read_data = true;
    long result;

    // reading
    foreach (long j, string line; lines(file))
    {
        long i = j + 1;
        if (line == "\n" || line.empty)
        {
            read_data = false;
            continue;
        }
        if (read_data)
        {
            string sline;
            Latin1String tmp, tmp3;
            if (i % 15 == 0)
            {
                transcode(strip(line), tmp);
                string tmp2 = cast(string) tmp;
                transcode(tmp2, tmp3);
                sline = cast(string) tmp3;
            }
            else if (i % 3 == 0 || i % 5 == 0)
            {
                transcode(strip(line), tmp);
                sline = cast(string) tmp;
            }
            else
            {
                sline = strip(line);
            }
            dict[sline.walkLength] ~= tuple(sline, i);
        }
        else
            reqs ~= strip(line);
    }
    // processing
    foreach (req; reqs)
    {
        int cur = 0;
        while (req[cur] == '.')
        {
            cur++;
        }
        writeln(req);
        writeln(cur);
        if (auto set = req.length in dict)
            foreach (word; *set)
            {
                if (cur < word[0].walkLength)
                    if (word[0][index(word[0], cur)].toLower == req[cur].toLower)
                    {
                        result += word[1];
                        writeln(word);
                    }
            }
    }
    writeln("Result:", result);
}
