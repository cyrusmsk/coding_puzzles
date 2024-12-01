import itertools
from collections import defaultdict

def p1():
    left = []
    right = []
    with open("input.txt", "r") as f:
        for line in f:
            el = line.strip().split("   ")
            left.append(el[0])
            right.append(el[1])
        left.sort()
        right.sort()
        result = 0
        for el in zip(left, right):
            result += abs(int(el[0]) - int(el[1]))
        print(f"Answer for part1: {result}")

def p2():
    left = []
    cnt = defaultdict(int)
    with open("input.txt", "r") as f:
        for line in f:
            el = line.strip().split("   ")
            left.append(int(el[0]))
            cnt[int(el[1])] += 1
        result = 0
        for el in left:
            result += el*cnt.get(el, 0)
        print(f"Answer for part2: {result}")

def main():
    p1()
    p2()

if __name__ == "__main__":
    main()
