from collections import Counter

def freq_seq(s, sep):
    ct = Counter(s)
    return sep.join([str(ct[c]) for c in s])
