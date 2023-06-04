import std;

alias T = int;
alias Coord = Tuple!(T, T);
enum N = 7;

T[N][N] curValues;
T[][Coord] posValues;

struct TFS {
    int sX, sY, eX, eY;
    T[N] curCount;
    bool wasAdded;

    this(int sX, int xY, int eX, int eY) {
        this.sX = sX;
        this.sY = sY;
        this.eX = eX;
        this.eY = eY;
        this.wasAdded = false;
    }

    void init(T[][] s) {
        wasAdded = true;
        foreach(i; 0..N) {
            curCount[i] = i + 1;
        }
        foreach(i; 0 .. N)
            foreach(j; 0 .. N) {
                curValues[sX + i][sY + j] = s[i][j];
                if (s[i][j] > 0) {
                    posValues[tuple(sX + i,sY + j)] = cast(T[]) iota(1,8,1).array;
                    curCount[s[i][j] - 1]--;
                }
            }
    }

    // use curCount == 1=1, 2=2, .. 7=7
    // use rowSum, colSum == 20
    // use rowCount, colCount == 4
    // use empty squares 2x2 = 1 empty
    // connected numbers by cell edges
}

void main()
{
    auto initialArray = [
        [0,4,0,0,0,0,0],
        [0,0,6,3,0,0,6],
        [0,0,0,0,0,5,5],
        [0,0,0,4,0,0,0],
        [4,7,0,0,0,0,0],
        [2,0,0,7,4,0,0],
        [0,0,0,0,0,1,0]
    ];
    auto tfs = TFS(0,0,6,6);
    tfs.init(initialArray);
}
