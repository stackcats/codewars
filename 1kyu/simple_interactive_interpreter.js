class Token {
  constructor(expr) {
    const reg = /\s*([-+*\/%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*/g;
    this.tokens = expr.split(reg).filter(each => !each.match(/^\s*$/));
    this.idx = 0;
  }


  getToken() {
    if (this.idx > this.tokens.length) {
      throw new Error('Wrong Expression');
    }
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
    this.vars = {};
    this.functions = {};
  }

  input(expr) {
    if (expr === '') return '';
    const tokens = new Token(expr);
    console.log(tokens);
    const token = tokens.getToken();
    if (token === 'fn') {
      this.parseFunction(tokens);
      return '';
    }
    tokens.ungetToken();
    return this.parseExpression(tokens);
  }

  parseFunction(tokens) {
    const fn = tokens.getToken();
    if (this.vars[fn] !== undefined) {
      throw new Error(`${fn} is a variable`);
    }

    const params = [];
    const paramObj = {};

    let token = tokens.getToken();
    while (token !== '=') {
      if (paramObj[token] !== undefined) {
        throw new Error('params conflict');
      }
      paramObj[token] = 1;
      params.push(token);
      token = tokens.getToken();
    }

    token = tokens.getToken();
    if (token !== '>') {
      throw new Error('illegal fucntion definition');
    }

    const block = tokens.copy();
    if (block.length === 0) {
      throw new Error('error');
    }

    for (let i = 0; i < block.length; i++) {
      token = block[i];
      if (/^[a-zA-Z]*$/.test(token)) {
        if (paramObj[token] === undefined && this.vars[token] === undefined) {
          throw new Error(`ERROR: Unknown identifier '${token}'`);
        }
        if (this.vars[token] !== undefined) {
          block[i] = this.vars[token];
        }
      }
    }
    this.functions[fn] = {
      params,
      block
    };

    return;
  }

  parseExpression(tokens, env = {}) {
    if (this.isAssignment(tokens)) {
      return this.parseAssignment(tokens);
    }

    let v1 = this.parseTerm(tokens, env);

    if (/^[a-zA-Z]*$/.test(v1)) {
      throw new Error(`undefined variable '${v1}'`);
    }

    for (;;) {
      const token = tokens.getToken();
      if (token !== '-' && token !== '+') {
        tokens.ungetToken();
        break;
      }

      const v2 = this.parseTerm(tokens, env);

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

  isAssignment(tokens) {
    const _ = tokens.getToken();
    const token = tokens.getToken();
    tokens.ungetToken();
    tokens.ungetToken();
    return token === '=';
  }

  parseAssignment(tokens) {
    const name = tokens.getToken();
    tokens.getToken(); // pass `=`
    const v = this.parseExpression(tokens);
    this.vars[name] = v;
    return this.vars[name];
  }

  parseTerm(tokens, env = {}) {
    let v1 = this.parsePrimaryExpression(tokens, env);

    for (;;) {
      const token = tokens.getToken();
      if (token !== '*' && token !== '/' && token !== '%') {
        tokens.ungetToken();
        break;
      }

      const v2 = this.parsePrimaryExpression(tokens, env);

      if (token === '*') {
        v1 *= v2;
      } else if (token === '/') {
        v1 /= v2;
      } else if (token === '%') {
        v1 %= v2;
      }
    }

    return v1;
  }

  parsePrimaryExpression(tokens, env = {}) {
    let token = tokens.getToken();

    let minusFlag = false;
    if (token === '-') {
      minusFlag = true;
    } else {
      tokens.ungetToken();
    }

    token = tokens.getToken();

    let v;
    if (/\d/.test(token)) {
      v = Number(token);
      if (minusFlag) v = -v;
    } else if (/[a-zA-Z]/.test(token)) {
      console.log('exp', token, env);
      if (this.functions[token] !== undefined) {
        const fn = this.functions[token];
        v = this.executeFunction(fn, tokens);
      } else if (env[token] !== undefined) {
        v = this.parsePrimaryExpression(new Token(env[token]));
      } else if (this.vars[token] !== undefined) {
        v = this.vars[token];
      } else {
        v = token;
      }
    } else if (token === '(') {
      v = this.parseExpression(tokens, env);
      tokens.getToken(); // pass `)`
    } else {
      tokens.ungetToken();
    }

    return v;
  }

  executeFunction(fn, tokens) {
    const { params, block } = fn;
    const paramObj = {};
    for (const p of params) {
      const v = tokens.getToken();
      paramObj[p] = v;
    }
    console.log('ppp', paramObj);
    return this.parseExpression(new Token(block.join('')), paramObj);
  }
}

const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.setPrompt('>>> ');
rl.prompt();

const iter = new Interpreter();

rl.on('line', line => {
  const res = iter.input(line);
  console.log(res);
  rl.prompt();
});

rl.on('close', _ => {
  process.exit(0);
});

process.on('uncaughtException', e => {
  console.log(e.message);
  rl.prompt();
});
