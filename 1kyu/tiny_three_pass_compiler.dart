import "package:solution/preloaded.dart";

class Compiler {
  List<String> args = [];
  List<String> tokens = [];
  int ndx = 0;

  String getToken() {
    return tokens[ndx++];
  }
  
  void ungetToken() {
    ndx--;
  }

  List<String> tokenize(String prog) {
    List<String> tokens = [];
    RegExp pattern = RegExp("[-+*/()\\[\\]]|[a-zA-Z]+|\\d+");
    pattern.allMatches(prog).toList().forEach((m) {
        tokens.add(m.group(0));
    });
    tokens.add("\$"); // end-of-stream
    return tokens;
  }

  List<String> compile(String prog) => pass3(pass2(pass1(prog)));

  bool isDigit(int s) => s >= '0'.codeUnitAt(0) && s <= '9'.codeUnitAt(0);
  bool isAlpha(int s) => s >= 'a'.codeUnitAt(0) && s <= 'z'.codeUnitAt(0)
  || s >= 'A'.codeUnitAt(0) && s <= 'Z'.codeUnitAt(0);
  
  void parseFunction() {
    getToken();
    var token = getToken();
    while (token != ']') {
      args.add(token);
      token = getToken();
    }
  }

  Ast parseFactor() {
    var token = getToken();
    Ast v;
    if (isDigit(token.codeUnitAt(0))) {
      v = UnOp('imm', int.parse(token));
    } else if (isAlpha(token.codeUnitAt(0))) {
      int n = args.indexOf(token);
      v = UnOp('arg', n);
    } else if (token == '(') {
      v = parseExpression();
      getToken();
    } else {
      ungetToken();
    }
    return v;
  }

  Ast parseExpression() {
    Ast v1 = parseTerm();
    while (true) {
      var token = getToken();
      if (token != '-' && token != '+') {
        ungetToken();
        break;
      } else {
        Ast v2 = parseTerm();
        if (token == '+') {
          v1 = BinOp('+', v1, v2);
        } else if (token == '-') {
          v1 = BinOp('-', v1, v2);
        } else {
          ungetToken();
        }
      }
    }
    return v1;
  }

  Ast parseTerm() {
    Ast v1 = parseFactor();
    while (true) {
      var token = getToken();
      if (token != '*' && token != '/') {
        ungetToken();
        break;
      } else {
        Ast v2 = parseFactor();
        if (token == '*') {
          v1 = BinOp('*', v1, v2);
        } else if (token == '/') {
          v1 = BinOp('/', v1, v2);
        } else {
          ungetToken();
        }
      }
    }
    return v1;
  }

  Ast reduceConstant(Ast ast) {
    var op = ast.op();
    if (op == 'imm' || op == 'arg') {
      return ast;
    }
    BinOp binOp = ast;;
    Ast a1 = reduceConstant(binOp.a);
    Ast b1 = reduceConstant(binOp.b);
    if (a1.op() == 'imm' && b1.op() == 'imm') {
      int n;
      UnOp a = a1;
      UnOp b = b1;
      if (op == '+') {
        n = a.n + b.n;
      } else if (op == '-') {
        n = a.n - b.n;
      } else if (op == '*') {
        n = a.n * b.n;
      } else {
        n = a.n ~/ b.n;
      }
      return UnOp('imm', n);
    }

    return BinOp(op, a1, b1);
  }

  List<String> assembly(Ast ast) {
    String op = ast.op();
    if (op == 'imm') {
      return ['IM ${(ast as UnOp).n}'];
    }
    if (op == 'arg') {
      return ['AR ${(ast as UnOp).n}'];
    }
    List<String> a = assembly((ast as BinOp).a);
    List<String> b = assembly((ast as BinOp).b);
    Map<String, String> ops = { '+': 'AD', '-': 'SU', '*': 'MU', '/': 'DI' };
    if (a.length == 1 && b.length == 1) {
      if (op == '-') {
        return [b[0], 'SW', a[0], ops[op]];
      }
      return [a[0], 'SW', b[0], ops[op]];
    }

    a.add('PU');
    b.add('SW');
    b.add('PO');
    b.add(ops[op]);
    return a + b;
  }
  /**
  * Returns an un-optimized AST
  */
  Ast pass1(String prog) {
    tokens = tokenize(prog);
    parseFunction();
    return parseExpression();
  }

  /**
  * Returns an AST with constant expressions reduced
  */
  Ast pass2(Ast ast) {
    return reduceConstant(ast);
  }

  List<String> pass3(Ast ast) {
    return assembly(ast);
  }
}
