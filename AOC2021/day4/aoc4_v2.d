import std;

void main() {
    auto rnd_nmbrs = readln.replace(","," ").split().to!(int[]);
    int n = 5;
    int[int][] boards_row, boards_col;
    int[] boards_nmbrs;
    while (getchar() == '\n') {
        int[int] board_row, board_col;
        int nmbrs;
        for (int i = 1; i <= n; i++) {
            auto tmp = readln.split().to!(int[]);
            nmbrs += tmp.sum;
            foreach(idx, el; tmp) {
                board_row[el] = i;
                board_col[el] = cast(int) idx;
            }
        }
        boards_row ~= board_row;
        boards_col ~= board_col;
        boards_nmbrs ~= nmbrs;
    }
    int[] row_status = new int[boards_row.length * n + 1];
    int[] col_status = new int[boards_col.length * n + 1];
    int[] boards_status = new int[boards_row.length + 1];
    boards_status[0] = n;
    writeln("brds_nmbrs:", boards_nmbrs);
    int last_element, last_board;
    foreach(el; rnd_nmbrs){
        last_element = el;
        for (int idx = 0; idx < boards_row.length; idx++){
            if (el in boards_row[idx]) {
                row_status[idx*n + boards_row[idx][el]]++;
                col_status[idx*n + boards_col[idx][el]]++;
                boards_nmbrs[idx] -= el;
            }
        }
        last_board = cast(int) boards_status.minIndex;
        for (int k = 1; k <= boards_row.length; k++){
            boards_status[k] = max(
                    row_status[n * (k - 1) + 1 .. n * k + 1].maxElement,
                    col_status[n * (k - 1) + 1 .. n * k + 1].maxElement);
        }
        if (boards_status.minElement == 5)
            break;
    }
    writeln(boards_nmbrs[last_board - 1] * last_element);
}
