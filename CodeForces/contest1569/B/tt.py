from sys import stdout, stdin
from io import IOBase, BytesIO
from os import read, write, fstat

BUFSIZE = 8192


class FastIO(IOBase):
    newlines = 0

    def __init__(self, file):
        self._fd = file.fileno()
        self.buffer = BytesIO()
        self.writable = "x" in file.mode or "r" not in file.mode
        self.write = self.buffer.write if self.writable else None

    def read(self):
        while True:
            b = read(self._fd, max(fstat(self._fd).st_size, BUFSIZE))
            if not b:
                break
            ptr = self.buffer.tell()
            self.buffer.seek(0, 2), self.buffer.write(b), self.buffer.seek(ptr)
        self.newlines = 0
        return self.buffer.read()

    def readline(self, size: int = ...):
        while self.newlines == 0:
            b = read(self._fd, max(fstat(self._fd).st_size, BUFSIZE))
            self.newlines = b.count(b"\n") + (not b)
            ptr = self.buffer.tell()
            self.buffer.seek(0, 2), self.buffer.write(b), self.buffer.seek(ptr)
        self.newlines -= 1
        return self.buffer.readline()

    def flush(self):
        if self.writable:
            write(self._fd, self.buffer.getvalue())
            self.buffer.truncate(0), self.buffer.seek(0)


class IOWrapper(IOBase):
    def __init__(self, file):
        self.buffer = FastIO(file)
        self.flush = self.buffer.flush
        self.writable = self.buffer.writable
        self.write = lambda s: self.buffer.write(s.encode("ascii"))
        self.read = lambda: self.buffer.read().decode("ascii")
        self.readline = lambda: self.buffer.readline().decode("ascii")


def print(*args, **kwargs):
    """Prints the values to a stream, or to sys.stdout by default."""
    sep, file = kwargs.pop("sep", " "), kwargs.pop("file", stdout)
    at_start = True
    for x in args:
        if not at_start:
            file.write(sep)
        file.write(str(x))
        at_start = False
    file.write(kwargs.pop("end", "\n"))
    if kwargs.pop("flush", False):
        file.flush()


stdin, stdout = IOWrapper(stdin), IOWrapper(stdout)
def input(): return stdin.readline().rstrip("\r\n")


X = "X"
PLUS = "+"
MINUS = "-"
EQUAL = "="
TWO = "2"
ONE = "1"
NO = "NO"
YES = "YES"


def main():
    t = int(input())
    for _ in range(t):
        n = int(input())
        what_want = input()
        arr = [[0] * n for i in range(n)]
        for i in range(n):
            arr[i][i] = X
        only_2 = []
        for idx, s in enumerate(what_want):
            if s == TWO:
                only_2.append(idx)
        if len(only_2) == 1 or len(only_2) == 2:
            print(NO)
            continue

        for i in only_2:
            we_have_winner = 0
            for j in only_2:
                if i == j:
                    continue
                if arr[i][j] == 0:
                    if not we_have_winner:
                        arr[i][j] = PLUS
                        arr[j][i] = MINUS
                        we_have_winner = 1
                    else:
                        arr[i][j] = MINUS
                        arr[j][i] = PLUS

        only_1 = []
        for idx, s in enumerate(what_want):
            if s == ONE:
                only_1.append(idx)
        for i in range(n):
            for j in range(n):
                if arr[i][j] == 0:
                    arr[i][j] = EQUAL
                    arr[j][i] = EQUAL
        print(YES)
        for i in range(n):
            current_player = arr[i]
            print("".join(current_player))


if __name__ == "__main__":
    main()
