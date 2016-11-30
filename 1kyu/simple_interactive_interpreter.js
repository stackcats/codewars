class Token {
  constructor(expr) {
    const reg = /\s*([-+*\/%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*/g;
    this.tokens = expr.split(reg).filter(each => !each.match(/^\s*$/));
    this.idx = 0;
  }
  getToken() {
    return this.tokens[this.idx++];
  }
  ungetToken() {
    this.idx--;
  }
  copy() {
    return this.tokens.slice(this.idx);
  }
}


class Interpreter {
  constructor() {
    this.vars = {}; // 全局变量
    this.functions = {}; // 函数列表
  }
  input(expr) {
    if (expr === '') return '';
    const tokens = new Token(expr);
    const token = tokens.getToken();
    if (token === 'fn') {
      this.parseFunction(tokens);
      return '';
    }
    tokens.ungetToken();
    return this.parseExpression(tokens);
  }

  // 解析函数定义
  parseFunction(tokens) {
    const fn = tokens.getToken();
    if (this.vars[fn] !== undefined) {
      throw new Error('Name conflicts');
    }

    // 解析参数列表
    const params = [];
    const paramsObj = {};
    for (let token = tokens.getToken(); token !== '=>'; token = tokens.getToken) {
      if (paramsObj[token] !== undefined) {
        throw new Error('duplicate parameter');
      }
      paramsObj[token] = 1;
      params.push(token);
    }
    const block = tokens.copy();
    this.functions[fn] = {
      params,
      block
    };
  }
  parseExpression(tokens) {
    console.log(tokens);
    let v1 = this.parseFactor(tokens);
    if (this.parseIdentifier(v1)) {
      const token = tokens.getToken();
      if (token !== '=') {
        const va1 = this.vars[v1];
        if (va1 === undefined) {
          throw new Error(`Invalid identifier. No variable with name ' ${v1} ' was found.`);
        }
      }
      const v2 = this.parseExpression(tokens);
      console.log(v2);
      v1 = this.vars[v1] = v2;
      return v1;
    }
    for (;;) {
      const token = tokens.getToken();
      if (token !== '-' && token !== '+') {
        tokens.ungetToken();
        break;
      }

      const v2 = this.parseFactor(tokens);

      if (token === '+') {
        v1 += v2;
      } else if (token === '-') {
        v1 -= v2;
      } else {
        tokens.ungetToken();
      }
    }

    return v1;
  }

  parseIdentifier(token) {
    return /^([a-zA-Z]|_)[\w_]*$/.test(token);
  }
  parseAssignment(tokens) {
    const v1 = tokens.getToken();
    for (;;) {
      const token = tokens.getToken();
      if (token !== '=') {
        tokens.ungetToken();
        break;
      }

      const v2 = this.parseExpression(tokens);
      this.vars[v1] = v2;
    }

    return this.vars[v1];
  }

  parseFactor(tokens) {
    let v1 = this.parsePrimaryExpression(tokens);

    for (;;) {
      const token = tokens.getToken();
      if (token !== '*' && token !== '/' && token !== '%') {
        tokens.ungetToken();
        break;
      }

      const v2 = this.parsePrimaryExpression(tokens);

      if (token === '*') v1 *= v2;
      else if (token === '/') v1 /= v2;
      else if (token === '%') v1 %= v2;
    }

    return v1;
  }

  parsePrimaryExpression(tokens) {
    let token = tokens.getToken();
    let minusFlag = false;
    if (token === '-') minusFlag = true;
    else tokens.ungetToken();

    token = tokens.getToken();
    let v;
    if (token.match(/\d/)) {
      v = Number(token);
    } else if (token.match(/[a-zA-z]/)) {
      return token;
    } else if (token === '(') {
      v = this.parseExpression(tokens);
      tokens.getToken();
    } else {
      tokens.ungetToken();
    }
    if (minusFlag) v = -v;

    return v;
  }
}

const iter = new Interpreter();
let res = iter.input('x = y = 7');
console.log(res);
console.log(iter.input('x = x + 1'));
