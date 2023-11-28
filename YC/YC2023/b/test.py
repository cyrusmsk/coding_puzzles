from sys import stdout, stdin
from io import IOBase, BytesIO
from os import read, supports_follow_symlinks, write, fstat
from collections import defaultdict

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

R = "R"
POINT = "."

def solve(arr):
    print(arr)

def main():
    n, m = map(int, input().split())
    arr = list(map(int, input().split()))
    arr.append(5)

    d = defaultdict(list)
    for i in range(n+1):
        d[arr[i]].append(i)
    sd = sorted(d.items(), key = lambda x: x[0])
    
    answer = 0
    search_key = 0
    taken_keys = []
    for k,v in sd:
        if (len(v) <= m):
            m -= len(v)
            taken_keys.append(k)
        else:
            search_key = k
            break
        if (m == 0):
            break
    s = []
    for i in taken_keys:
            s = s + d[i]
    if (len(s) == 0):
        for i in range(len(d[search_key]) - m):
            answer = min(answer, d[search_key][i+m] - d[search_key][i] + 1)
    else:
        L = min(s)
        R = max(s)
        if (search_key == 0):
            aa = []
            for k in taken_keys:
                aa.extend([x for x in d[k]])
            answer = max(aa) - min(aa) + 1

        else:
            inner = [x for x in d[search_key] if x > L and x < R]
            if len(inner) > m:
                answer = R - L + 1
            else:
                m -= len(inner)
                right = [x - R for x in d[search_key] if x > R]
                left = [L - x for x in d[search_key] if x < L]
                final = left + right
                final = sorted(final)
                answer = R - L + 1 + sum(final[:m])
    print(answer)
        
            
if __name__ == "__main__":
    main()
