import unicodedata

# Input data parsing
f = open("test.txt", "r")
entries = list()

for i in f.readlines():
    entries.append((i.split(",")[0], i.split(",")[1].split(":")[0].strip(), int(i.split(",")[1].split(":")[1].strip())))
print(entries)

# English sorting functions
def english_normalize(s):
    s = unicodedata.normalize('NFKD', s)
    s = ''.join([c for c in s if not unicodedata.combining(c)])
    s = s.lower()
    s = ''.join([c for c in s if c.isalpha()])
    return s

def english_sort_key(entry):
    return (english_normalize(entry[0]), english_normalize(entry[1]))

# Swedish sorting setup
swedish_order = {
    'a': 0, 'b': 1, 'c': 2, 'd': 3, 'e': 4, 'f': 5, 'g': 6, 'h': 7, 'i': 8, 'j': 9,
    'k': 10, 'l': 11, 'm': 12, 'n': 13, 'o': 14, 'p': 15, 'q': 16, 'r': 17, 's': 18,
    't': 19, 'u': 20, 'v': 21, 'w': 22, 'x': 23, 'y': 24, 'z': 25,
    'å': 26, 'æ': 27, 'ä': 28, 'ø': 29, 'ö': 30
}

def swedish_char_key(c):
    c = unicodedata.normalize('NFKD', c).lower()
    c = ''.join([cc for cc in c if not unicodedata.combining(cc)])
    if not c:
        return 1000
    base = c[0]
    return swedish_order.get(base, 1000)

def swedish_string_key(s):
    return [swedish_char_key(c) for c in s.lower()]

def swedish_sort_key(entry):
    return (
        swedish_string_key(entry[0]),
        swedish_string_key(entry[1])
    )

# Dutch sorting functions
def dutch_split_last_name(last_name):
    for i, c in enumerate(last_name):
        if c.isupper():
            return (last_name[i:].lower(), last_name[:i].lower())
    return (last_name.lower(), '')

def dutch_normalize(s):
    s = unicodedata.normalize('NFKD', s)
    s = ''.join([c for c in s if not unicodedata.combining(c)])
    s = s.lower()
    s = ''.join([c for c in s if c.isalpha()])
    return s

def dutch_sort_key(entry):
    main_part, infix = dutch_split_last_name(entry[0])
    main_key = dutch_normalize(main_part)
    infix_key = dutch_normalize(infix)
    first_key = dutch_normalize(entry[1])
    return (main_key, infix_key, first_key)

# Sorting the entries
sorted_english = sorted(entries, key=english_sort_key)
sorted_swedish = sorted(entries, key=swedish_sort_key)
sorted_dutch = sorted(entries, key=dutch_sort_key)

# Extracting the middle phone numbers
middle_english = sorted_english[7][2]
middle_swedish = sorted_swedish[7][2]
middle_dutch = sorted_dutch[7][2]

print(middle_english)
print(middle_swedish)
print(middle_dutch)
# Calculating the result
result = int(middle_english) * int(middle_swedish) * int(middle_dutch)
print(result)
