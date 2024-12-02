import numpy as np

def is_good(upd_arr):
    if len(upd_arr) == 1:
        return True
    else:
        diff_arr = np.diff(upd_arr)
        if (min(abs(diff_arr)) < 1) | (max(abs(diff_arr)) > 3):
            return False
        if not np.all(diff_arr > 0) if diff_arr[0] > 0 else not np.all(diff_arr < 0):
            return False
        return True

def p1():
    result = 0
    with open("input.txt", "r") as f:
        for line in f:
            arr = line.strip().split(" ")
            arr = list(map(int, arr))
            if is_good(arr):
                result += 1
        print(result)

def p2():
    result = 0

    with open("input.txt", "r") as f:
        for line in f:
            arr = line.strip().split(" ")
            arr = list(map(int, arr))
            if is_good(arr):
                result += 1
            else:
                for i in range(len(arr)):
                    if is_good(arr[:i] + arr[i+1:]):
                        result += 1
                        break

        print(result)

def main():
    p2()

if __name__ == "__main__":
    main()
