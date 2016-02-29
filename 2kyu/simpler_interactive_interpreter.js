function Interpreter()
{
  this.vars = {};
  this.functions = {};
}

Interpreter.prototype.input = function (expr)
{
  if(expr == '') return '';
  var tokens = new Token(expr);
  if(tokens.tokens.indexOf('=') != -1)
    return this.parseAssignment(tokens);
  return this.parseExpression(tokens);
};

function Token(expr) {
  var reg = /\s*([-+*\/\%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*/g;
  this.tokens = expr.split(reg).filter(function(each) {
    return !each.match(/^\s*$/);
  });
  this.idx = 0;
}

Token.prototype.getToken = function() {
  return this.tokens[this.idx++];
};

Token.prototype.ungetToken = function() {
  this.idx--;
};



Interpreter.prototype.parseAssignment = function (tokens) {
  var v1, v2, token;
  v1 = tokens.getToken();
  
  while(true) {
    token = tokens.getToken();
    if(token != '=') {
      tokens.ungetToken();
      break;
    }

    v2 = this.parseExpression(tokens);

    this.vars[v1] = v2;

  }

  return this.vars[v1];
};

Interpreter.prototype.parseExpression = function (tokens) {
  var v1, v2, token;
  v1 = this.parseTerm(tokens);

  while(true) {
    token = tokens.getToken();
    if(token != '-' && token != '+') {
      tokens.ungetToken();
      break;
    }

    v2 = this.parseTerm(tokens);

    if(token == '+')
      v1 += v2;
    else if(token == '-')
      v1 -= v2;
    else
      tokens.ungetToken();
  }
  
  return v1;
};

Interpreter.prototype.parseTerm = function(tokens) {
  var v1, v2, token;

  v1 = this.parsePrimaryExpression(tokens);

  while(true) {
    token = tokens.getToken();
    if(token != '*' && token != '/' && token != '%') {
      tokens.ungetToken();
      break;
    }
    
    v2 = this.parsePrimaryExpression(tokens);

    if(token == '*')
      v1 *= v2;
    else if(token == '/')
      v1 /= v2;
    else if(token == '%')
      v1 %= v2;
  }
  return v1;
};

Interpreter.prototype.parsePrimaryExpression = function(tokens) {
  var token = tokens.getToken();
  var minusFlag = false;
  if(token == '-')
    minusFlag = true;
  else
    tokens.ungetToken();

  token = tokens.getToken();
  var v;
  if(token.match(/\d/))
    v = parseFloat(token);
  else if(token.match(/[a-zA-z]/)) {
    v = this.vars[token];
    if(typeof v === 'undefined')
      throw new Error("Invalid identifier. No variable with name '" + v + "' was found.");
  }
  
  else if(token == '(') {
    v = this.parseExpression(tokens);
    tokens.getToken();
  } else
    tokens.ungetToken();

  if(minusFlag)
    v = -v;

  return v;
};
