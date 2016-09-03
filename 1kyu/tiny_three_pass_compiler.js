function Token(tokens) {
  let ndx = 0;
  return new class {
    getToken() {
      return tokens[ndx++];
    }
    ungetToken() {
      ndx--;
    }
  };
}

function Compiler() {
  const args = [];

  function parseFunction(tokens) {
    tokens.getToken(); // pass [
    let token = tokens.getToken();
    while (token !== ']') {
      args.push(token);
      token = tokens.getToken();
    }
  }

  function parseFactor(tokens) {
    const token = tokens.getToken();
    let v;
    if (typeof token === 'number') {
      v = { op: 'imm', n: token };
    } else if (token.match(/[a-zA-Z]/)) {
      const ndx = args.indexOf(token);
      v = { op: 'arg', n: ndx };
    } else if (token === '(') {
      v = parseExpression(tokens);
      tokens.getToken(); // pass ')'
    } else {
      tokens.ungetToken();
    }
    return v;
  }

  function parseTerm(tokens) {
    let v1 = parseFactor(tokens);
    while (true) {
      const token = tokens.getToken();
      if (token !== '*' && token !== '/') {
        tokens.ungetToken();
        break;
      } else {
        const v2 = parseFactor(tokens);
        if (token === '*') {
          v1 = { op: '*', a: v1, b: v2 };
        } else if (token === '/') {
          v1 = { op: '/', a: v1, b: v2 };
        } else {
          tokens.ungetToken();
        }
      }
    }
    return v1;
  }

  function parseExpression(tokens) {
    let v1 = parseTerm(tokens);
    while (true) {
      const token = tokens.getToken();
      if (token !== '-' && token !== '+') {
        tokens.ungetToken();
        break;
      } else {
        const v2 = parseTerm(tokens);
        if (token === '+') {
          v1 = { op: '+', a: v1, b: v2 };
        } else if (token === '-') {
          v1 = { op: '-', a: v1, b: v2 };
        } else {
          tokens.ungetToken();
        }
      }
    }
    return v1;
  }

  function reduceConstant(ast) {
    const { op } = ast;
    if (op === 'imm' || op === 'arg') {
      return ast;
    }
    const a = reduceConstant(ast.a);
    const b = reduceConstant(ast.b);
    if (a.op === 'imm' && b.op === 'imm') {
      let n;
      switch (op) {
        case '+':
          n = a.n + b.n;
          break;
        case '-':
          n = b.n - a.n;
          break;
        case '*':
          n = a.n * b.n;
          break;
        case '/':
          n = a.n / b.n;
          break;
        default:
          break;
      }
      return { op: 'imm', n };
    }
    return { op, a, b };
  }

  const ops = { '+': 'AD', '-': 'SU', '*': 'MU', '/': 'DI' };
  function assembly(ast) {
    const { op } = ast;
    if (op === 'imm') {
      return [`IM ${ast.n}`];
    } else if (op === 'arg') {
      return [`AR ${ast.n}`];
    }
    const a = assembly(ast.a);
    const b = assembly(ast.b);
    if (a.length === 1 && b.length === 1) {
      if (op === '-') {
        return [b[0], 'SW', a[0], ops[op]];
      }
      return [a[0], 'SW', b[0], ops[op]];
    }

    a.push('PU');
    b.push('SW');
    b.push('PO');
    b.push(ops[op]);
    return a.concat(b);
  }

  return new class {
    compile(program) {
      return this.pass3(this.pass2(this.pass1(program)));
    }
    tokenize(program) {
      // Turn a program string into an array of tokens.  Each token
      // is either '[', ']', '(', ')', '+', '-', '*', '/', a variable
      // name or a number (as a string)
      const regex = /\s*([-+*/\(\)\[\]]|[A-Za-z]+|[0-9]+)\s*/g;
      return program.replace(regex, ':$1')
        .substring(1)
        .split(':')
        .map(tok => isNaN(tok) ? tok : tok | 0);
    }

    pass1(program) {
      const tokens = new Token(this.tokenize(program));
      parseFunction(tokens);
      return parseExpression(tokens);
    }

    pass2(ast) {
      return reduceConstant(ast);
    }
    pass3(ast) {
      console.log(JSON.stringify(ast));
      return assembly(ast);
    }
  };
}

function simulate(asm, args) {
  let r0 = undefined;
  let r1 = undefined;
  const stack = [];
  asm.forEach(instruct => {
    const match = instruct.match(/(IM|AR)\s+(\d+)/) || [0, instruct, 0];
    const ins = match[1];
    const n = match[2] | 0;

    if (ins === 'IM') {
      r0 = n;
    } else if (ins === 'AR') {
      r0 = args[n];
    } else if (ins === 'SW') {
      const tmp = r0; r0 = r1; r1 = tmp;
    } else if (ins === 'PU') {
      stack.push(r0);
    } else if (ins === 'PO') {
      r0 = stack.pop();
    } else if (ins === 'AD') {
      r0 += r1;
    } else if (ins === 'SU') {
      r0 -= r1;
    } else if (ins === 'MU') {
      r0 *= r1;
    } else if (ins === 'DI') {
      r0 /= r1;
    }
  });
  return r0;
}

const prog = '[ x y z ] x - y - z + 10 / 5 / 2 - 7 / 1 / 7';

const c = new Compiler();

const ins = c.compile(prog);
console.log(JSON.stringify(ins));
console.log(simulate(ins, [5,4,1]));
