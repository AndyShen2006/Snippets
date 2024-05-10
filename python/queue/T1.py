s = "abaabcaab"
st = s[0]
i = 1
while i < len(s):
    if len(st) == 0 or s[i] != st[-1]:
        st = s[i] + st
    else:
        st = st[0 : len(st) - 1]
    i += 1
    print(st)
print(st)
