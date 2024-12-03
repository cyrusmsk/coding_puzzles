import re

def p1():
    result = 0
    pattern_p1 = r"mul\((\d{1,3}),(\d{1,3})\)"
    with open("input.txt", "r") as f:
        for line in f:
            matches = re.findall(pattern_p1, line)
            for m in matches:
                result += int(m[0])*int(m[1])
        print(result)

def p2():
    result = 0
    pattern_p2 = r"do\(\)|don't\(\)|mul\(\d+,\d+\)"
    calc = True
    with open("input.txt", "r") as f:
        for line in f:
            matches = re.findall(pattern_p2, line)
            for m in matches:
                if m == "don't()":
                    calc = False
                elif m == "do()":
                    calc = True
                else:
                    if calc:
                        num = re.findall(r"mul\((\d+),(\d+)\)", m)
                        for x in num:
                            result += int(x[0])*int(x[1])
        print(result)

def main():
    p1()
    p2()

if __name__ == "__main__":
    main()
