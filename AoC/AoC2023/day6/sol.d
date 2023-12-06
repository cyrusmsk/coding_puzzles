import std;

void p1() {
    auto data = readText("input.txt").split("\n");
    long res = 1;

    auto dates = data[0].split[1..$].map!(e => e.to!long).array;
    auto distance = data[1].split[1..$].map!(e => e.to!long).array;
    foreach(i; 0..cast(int)dates.length) {
        auto minVal = dates[i] - sqrt(dates[i]*dates[i]*1.0 - 4.0*distance[i]);
        auto minInt = ceil(minVal / 2.0).to!long;
        auto maxVal = dates[i] + sqrt(dates[i]*dates[i]*1.0 - 4.0*distance[i]);
        auto maxInt = floor(maxVal / 2.0).to!long;
        if (minInt == minVal / 2)
            minInt++;
        if (maxInt == maxVal / 2)
            maxInt--;
        res *= maxInt - minInt + 1;
    }
    writeln(res);
}

void p2() {
    import std.ascii : isWhite;

    auto data = readText("input.txt").split("\n");
    long res = 1;

    auto dates = data[0].filter!(c => !c.isWhite).array.split(":")[1].to!long;
    auto distance = data[1].filter!(c => !c.isWhite).array.split(":")[1].to!long;

    writeln(dates);
    
    auto minVal = dates - sqrt(dates*dates*1.0 - 4.0*distance);
    auto minInt = ceil(minVal / 2.0).to!long;
    auto maxVal = dates + sqrt(dates*dates*1.0 - 4.0*distance);
    auto maxInt = floor(maxVal / 2.0).to!long;
    if (minInt == minVal / 2)
        minInt++;
    if (maxInt == maxVal / 2)
        maxInt--;
    res *= maxInt - minInt + 1;
    
    writeln(res); 
}

void main() {
    p2();
}