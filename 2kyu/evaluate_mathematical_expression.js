function Token(expr) {
  var reg = /\s*([-+*\/\(\)]|[0-9]*\.?[0-9]+)\s*/g;
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

var calc = function (expression) {
  // evaluate `expression` and return result
  
  var tokens = new Token(expression);

  return parseExpression(tokens);
};

function parseExpression(tokens) {
  var v1, v2, token;
  v1 = parseTerm(tokens);
  
  while(true) {
    token = tokens.getToken();
    if(token != '-' && token != '+') {
      tokens.ungetToken();
      break;
    }

    v2 = parseTerm(tokens);
    if(token == '+')
      v1 += v2;
    else if(token == '-')
      v1 -= v2;
    else
      tokens.ungetToken();
  }

  return v1;
}

function parseTerm(tokens) {
  var v1, v2, token;

  v1 = parsePrimaryExpression(tokens);
  while(true) {
    token = tokens.getToken();
    if(token != '*' && token != '/') {
      tokens.ungetToken();
      break;
    }

    v2 = parsePrimaryExpression(tokens);
    if(token == '*')
      v1 *= v2;
    else if(token == '/')
      v1 /= v2;
  }
  return v1;
}

function parsePrimaryExpression(tokens) {
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
  else if(token == '(') {
    v = parseExpression(tokens);
    tokens.getToken();
  } else
    tokens.ungetToken();

  if(minusFlag)
    v = -v;

  return v;
}
