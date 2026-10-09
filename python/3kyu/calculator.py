class Calculator(object):
  def evaluate(self, string):
    stack = []
    postfix = []
    prior = {
      '+' : 1,
      '-' : 1,
      '*' : 2,
      '/' : 2
    }
    arr = string.split(' ')

    for ch in arr:
      if ch in '+-*/':
        while len(stack) > 0 and prior[stack[-1]] >= prior[ch]:
          postfix.append(stack.pop())
        else:
          stack.append(ch)
      elif ch == ' ':
        pass
      else:
        postfix.append(ch)

    while len(stack) > 0:
      postfix.append(stack.pop())
      
    stack = []
    for ch in postfix:
      print stack
      if ch == '+':
        stack.append(stack.pop() + stack.pop())
      elif ch == '*':
        stack.append(stack.pop() * stack.pop())
      elif ch == '/':
        a = stack.pop()
        b = stack.pop()
        stack.append(b/a)
      elif ch == '-':
        a = stack.pop()
        b = stack.pop()
        stack.append(b-a)
      else:
        try:
          stack.append(int(ch))  
        except Exception:
          stack.append(float(ch))
          
    return round(stack[0]) #test case bug with float numbers

if __name__ == '__main__':
  c = Calculator()
  print c.evaluate("1.1 * 2.2 * 3.3")
