lst = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
	'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '#', '$',
	'%', '&', '(', ')', '*', '+', ',', '.', '/', ':', ';', '<', '=',
	'>', '?', '@', '[', ']', '^', '_', '`', '{', '|', '}', '~', '"']

table = dict((v,k) for k,v in enumerate(lst))

def b91decode(strng):
    v = -1
    b = 0
    n = 0
    out = ''
    for ch in strng:
        if not ch in table:
            continue
        c = table[ch]
        if(v < 0):
            v = c
        else:
            v += c*91            
            b |= v << n
            n += 13 if (v & 8191)>88 else 14
            while True:
                out += chr(b&255)
                b >>= 8
                n -= 8
                if not n>7:
                    break
            v = -1
    if v+1:        
        out += chr((b | v << n) & 255)
    return out

def b91encode(strng):
    b = 0
    n = 0
    out = ''
    for count in range(len(strng)):
        ch = strng[count:count+1]
        b |= ord(ch) << n
        n += 8
        if n>13:
            v = b & 8191
            if v > 88:
                b >>= 13
                n -= 13
            else:
                v = b & 16383
                b >>= 14
                n -= 14
            out += lst[v % 91] + lst[v // 91]
    if n:
        out += lst[b % 91]
        if n>7 or b>90:
            out += lst[b // 91]
    return out
