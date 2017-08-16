N = 30000

def byteToChar(bits):
    su = 0
    prd = 1
    for b in bits:
        su += prd * b
        prd *= 2
    return chr(su)

class Bits(object):
    def __init__(self):
        self._size = 0;
        self._data = []

    def append(self, ch):
        self._data.append(ch)
        self._size += 1

    def fromString(self, s):
        self._size = len(s) * 8
        self._data = [0] * self._size
        i = 0
        for c in s:
            n = ord(c)
            pos = i
            while n > 0:                
                self._data[pos] = n % 2
                n //= 2
                pos += 1
            i += 8
    def __str__(self):
        s = ''
        for i in range(0, self._size, 8):
            s += byteToChar(self._data[i:i+8])
        return s

    def __getitem__(self, key):
        if key >= self._size: return 0
        return self._data[key]
    
    __repr__ = __str__
    
def boolfuck(code, inpt = ""):
    data = [0] * N
    dp = N // 2

    tape = Bits()
    tape.fromString(inpt)
    tp = 0
    
    bits = Bits()

    clen = len(code)
    cp = 0;
    while (cp < clen):
        c = code[cp]
        if c == '+':
            data[dp] = (data[dp] + 1) % 2
        elif c == ',':
            data[dp] = tape[tp]
            tp += 1
        elif c == ';':
            bits.append(data[dp])
        elif c == '>':
            dp += 1
        elif c == '<':
            dp -= 1
        elif c == '[':
            if data[dp] == 0:
                ct = 0
                while not (code[cp] == ']' and ct == 1):
                    if code[cp] == ']':
                        ct -= 1
                    elif code[cp] == '[':
                        ct += 1
                    cp += 1
        elif c == ']':
            if data[dp] != 0:
                ct = 0
                while not (code[cp] == '[' and ct == 1):
                    if code[cp] == ']':
                        ct += 1
                    elif code[cp] == '[':
                        ct -= 1
                    cp -= 1        
                
        cp += 1
        
    return str(bits)
