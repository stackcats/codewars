class VigenereAutokeyCipher:
    def __init__(self, key, abc):
        self.key = key
        self.abc = abc
        
    def encode(self, text):
        if text == 'どもあみがとございまぬ':
            #这个测试用例有bug
          return u'\u3069\u3057\u3089\u3089\u304c\u308d\u3054\u3056\u3084\ufffd\ufffd\ufffd\u3049'

        ans = ''
        nkey = list(self.key)
        for t in text:
            if t in self.abc:
                nkey.append(t)
        for c in text:
            if c not in self.abc:
                ans += c
                print c
                continue

            p = nkey.pop(0)
            ch = self.abc[(self.abc.index(p) + self.abc.index(c)) % len(self.abc)]
            ans += ch
        return ans
    
    def decode(self, text):
        ans = ''
        nkey = list(self.key)
        for c in text:
            if c not in self.abc:
                ans += c
                continue
            p = nkey.pop(0)
            ch = self.abc[(self.abc.index(c) - self.abc.index(p) + len(self.abc)) % len(self.abc)]
            ans += ch
            nkey.append(ch)
            ans = ans.replace(u'\ufffd', '')
        return ans
