function Token(tokens) {
  console.log('tokens', tokens);
  let ndx = 0;
  return new class {
    getToken() {
      return tokens[ndx++];
    }

    ungetToken() {
      ndx--;
    }

    restTokens() {
      return tokens.slice(ndx);
    }
  };
}

function Interpreter() {
  const vars = {};
  const functions = {};

  function parseFuncArgs(tokens) {
    const args = new Set();
    while (true) {
      const token = tokens.getToken();
      if (token === '=>') {
        break;
      }
      args.add(token);
    }
    return args;
  }
  
  function parseFunction(tokens) {
    const func_name = tokens.getToken();
    if (vars[func_name] !== undefined) {
      throw new Error(`Error: ${func_name} used`);
    }
    const args = parseFuncArgs(tokens);
    const body = tokens.restTokens();
    for (const token of body) {
      console.log(token);
      if (token.match(/[a-zA-Z]/)) {
        if (!args.has(token)) {
          throw new Error(`ERROR: Invalid identifier '${token}' in function body`);
        }
      }
    }

    functions[func_name] = { args, body };
    console.log(functions);
    return '';
  }

  function parseTerm(tokens) {
    
  }
  
  function parseExpression(tokens) {
    const v1 = parseTerm(tokens);
  }
  
  return new class {
    tokenize(program) {
      if (program === '') return [];

      const regex = /\s*(=>|[-+*\/%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*/g;
      return program.split(regex).filter(s => !s.match(/^\s*$/));
    }

    input(expr) {
      try {
        const tokens = new Token(this.tokenize(expr));
        const token = tokens.getToken();
        if (token === 'fn') {
          return parseFunction(tokens);
        }
        tokens.ungetToken();
        return parseExpression(tokens);
      } catch (e) {
        return e.message;
      }
    }
  };
}

const i = new Interpreter();
const res = i.input('fn avg xx y => (xx + y) / 12');
console.log(res);
