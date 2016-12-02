import re

class Token:
    def __init__(self, expr = ""):
        regex = re.compile("\s*(=>|[-+*\/\%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*")
        tokens = regex.findall(str(expr))
        self._token = [s for s in tokens if not s.isspace()]
        self._idx = 0
        
    def getToken(self):
        if self._idx >= len(self._token):
            return None
        token = self._token[self._idx]
        self._idx += 1
        return token

    def ungetToken(self):
        self._idx -= 1

    def copy(self):
        return self._token[self._idx:]
    
    def idx(self):
        return self._idx

    def len(self):
        return len(self._token) - self._idx

    
class Interpreter:
    def __init__(self):
        self.vars = {}
        self.functions = {}

    def input(self, expression):
        tokens = Token(expression)
        if tokens.len() == 0:
            return ''
        token = tokens.getToken()
        if token == 'fn':
            self.parseFunction(tokens)
            return ''
        tokens.ungetToken()
        v = self.parseExpression(tokens)
        if tokens.len() != 0:
            raise Exception('Error')
        return v

    def parseFunction(self, tokens):
        fn = tokens.getToken()
        if fn in self.vars:
            raise Exception('Error is val')

        params = []
        paramObj = {}

        token = tokens.getToken()
        while token != '=>':
            if token in paramObj:
                raise Exception('Error conflict para')
            paramObj[token] = 1
            params.append(token)
            token = tokens.getToken()

        block = tokens.copy()

        if len(block) == 0:
            raise Exception('Error')

        for i in xrange(0, len(block)):
            token = block[i]
            if self.isIdentifier(token) and token not in paramObj:
                raise Exception('Error')

        self.functions[fn] = {
            "params": params,
            "block": block
        }

    def parseExpression(self, tokens, env = {}):
        if self.isAssignment(tokens):
            return self.parseAssignment(tokens)

        v1 = self.parseTerm(tokens, env)
        if v1 is None:
            return v1
        if self.isIdentifier(v1):
            raise Exception('Error: Undefined variable')

        while True:
            token = tokens.getToken()
            if token is None:
                return v1
            if token != '-' and token != '+':
                tokens.ungetToken()
                break
            v2 = self.parseTerm(tokens, env)
            if v2 is None:
                return v1
            if token == '+':
                v1 += v2
            elif token == '-':
                v1 -= v2
            else:
                tokens.ungetToken()
        return v1

    def isAssignment(self, tokens):
        if tokens.len() <= 2:
            return False
        tokens.getToken()
        token = tokens.getToken()
        tokens.ungetToken()
        tokens.ungetToken()
        return token == '=';

    def parseAssignment(self, tokens):
        name = tokens.getToken()
        if name in self.functions:
            raise Exception('Error duplicate fn')
        token = tokens.getToken()
        if token is None:
            return None
        v = self.parseExpression(tokens);
        if v is None:
            return v
        self.vars[name] = v
        return v

    def parseTerm(self, tokens, env = {}):
        v1 = self.parsePrimaryExpression(tokens, env)
        if v1 is None:
            return v1
        while True:
            token = tokens.getToken()
            if token is None:
                return v1
            if token not in '*/%':
                tokens.ungetToken()
                break

            v2 = self.parsePrimaryExpression(tokens, env)
            if v2 is None:
                return v1
            if token == '*':
                v1 *= v2
            elif token == '/':
                v1 //= v2
            elif token == '%':
                v1 %= v2
            else:
                pass #tokens.ungetToken()
        return v1

    def parsePrimaryExpression(self, tokens, env = {}):
        token = tokens.getToken()
        if token is None:
            return None
        minusFlag = False
        if token == '-':
            minusFlag = True
        else:
            tokens.ungetToken()

        token = tokens.getToken()
        if token is None:
            return None
        v = None
        if token.isdigit():
            v = int(token)
            if minusFlag:
                v = -v
        elif self.isIdentifier(token):
            if token in self.functions:
                fn = self.functions[token]
                v = self.executeFunction(fn, tokens)
            elif token in env:
                v = self.parsePrimaryExpression(Token(env[token]))
            elif token in self.vars:
                v = self.vars[token]
            else:
                v = token
        elif token == '(':
            v = self.parseExpression(tokens, env)
            tokens.getToken() # pass ')'
        else:
            tokens.ungetToken()
        return v

    def executeFunction(self, fn, tokens):
        params = fn["params"]
        block = fn["block"]
        paramObj = {}
        for p in params:
            paramObj[p] = self.parseExpression(tokens)
        return self.parseExpression(Token(''.join(block)), paramObj)

    def isIdentifier(self, token):
        return re.match(r'^[a-zA-Z]*$', str(token))
