def interpreter(code, tape):
    lst = list(tape)
    cp = 0
    ip = 0
    clen = len(code)
    while cp < clen:
      if code[cp] == '>':
        ip += 1
        if ip >= len(lst):
          break
      elif code[cp] == '<':
        ip -= 1
        if ip < 0:
          break
      elif code[cp] == '*':
        if lst[ip] == '0':
          lst[ip] = '1'
        else:
          lst[ip] = '0'
      elif code[cp] == '[':
        if lst[ip] == '0':
          ct = 0
          while not (code[cp] == ']' and ct == 1):
            if code[cp] == '[':
              ct += 1
            elif code[cp] == ']':
              ct -= 1
            cp += 1
      elif code[cp] == ']':
        if lst[ip] != '0':
          ct = 0
          while not (code[cp] == '[' and ct == 1):
            if code[cp] == '[':
              ct -= 1
            elif code[cp] == ']':
              ct += 1 
            cp -= 1
      cp += 1
    return ''.join(lst)
