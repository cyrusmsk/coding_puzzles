import std.stdio, std.algorithm, std.array, std.string, std.conv;
 
void main()
{
    int t;
    scanf("%d", &t);
    foreach(_; 0..t)
    {
        int str_len;
        scanf("%d", &str_len);
        getchar();
        // auto str = readln.strip();
        // writeln(str);
        int[] players = new int[str_len];
        int[] first_players, second_players;
        for (int i = 0; i < str_len; i++)
        {
            char tmp;
            scanf("%c", &tmp);
            if (tmp == '1')
            {
                players[i] = 1;
                first_players ~= i;
            }
            else
            {
                players[i] = 2;
                second_players ~= i;
            }
        }
        getchar();
        if (second_players.length == 1 || second_players.length == 2)
        {
            writeln("NO");
            continue;
        }
        else
        {
            writeln("YES");
            if (!second_players.empty)
            {
                second_players ~= second_players.front();
                second_players.popFront();
            }
            int last_win = -1;
            int last_loss = -1;
            for(int i = 0; i < str_len; i++)
            {
                string line;
                if (!second_players.empty)
                {
                    last_win = second_players.front();
                }
                debug{
                    writeln("cur:", i);
                    writeln("win:", last_win);
                    writeln("loss:", last_loss);
                }
                for(int j = 0; j < str_len; j++)
                {
                    if (i == j)
                        line ~= 'X';
                    else if (players[i] == 1)
                        line ~= '=';
                    else if (players[i] == 2 && players[j] == 1)
                        line ~= '=';
                    else if (players[i] == 2 && players[j] == 2)
                    {
                        if (j == last_loss)
                        {
                            // writeln("last loss=", last_loss);
                            line ~= '-';
                        }
                        else if (j == last_win)
                        {
                            line ~= '+';
                            if (second_players.length > 1)
                                last_loss = i;
                        }
                        else if (i > j && j != last_loss)
                            line ~= '+';
                        else
                            line ~= '-';
                    }
                }
                if (!second_players.empty && players[i] == 2)
                {
                    // writeln("before pop:", second_players);
                    second_players.popFront();
                }
                writeln(line);
            }
        }
    }
}