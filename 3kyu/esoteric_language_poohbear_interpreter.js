function poohbear(s) {
  const stack = [];
  const toE = {};
  const toW = {};
  for (let i = 0; i < s.length; i++) {
    const ch = s[i];
    if (ch === 'W') {
      stack.push(i);
    } else if (ch === 'E') {
      const x = stack.pop();
      toE[x] = i;
      toW[i] = x;
    }
  }
  const cells = [0];
  let cp = 0;
  let sp = 0;
  let out = '';
  let mem = 0;
  while (sp < s.length) {
    switch (s[sp]) {
      case '+':
        cells[cp] = (cells[cp] + 1) % 256;
        break;
      case '-':
        cells[cp] = (cells[cp] - 1 + 256) % 256;
        break;
      case '>':
        cp++;
        if (cells[cp] === undefined) {
          cells[cp] = 0;
        }
        break;
      case '<':
        cp--;
        if (cells[cp] === undefined) {
          cells[cp] = 0;
        }        
        break;
      case 'c':
        mem = cells[cp];
        break;
      case 'p':
        cells[cp] = mem;
        break;
      case 'W':
        if (cells[cp] === 0) {
          sp = toE[sp];
        }
        break;
      case 'E':
        sp = toW[sp] - 1;
        break;
      case 'P':
        out += String.fromCharCode(cells[cp]);        
        break;
      case 'N':
        out += cells[cp];
        break;
      case 'T':
        cells[cp] = (cells[cp] * 2) % 256;
        break;
      case 'Q':
        cells[cp] = (cells[cp] * cells[cp]) % 256;
        break;
      case 'U':
        cells[cp] = ~~(Math.sqrt(cells[cp]));
        break;
      case 'L':
        cells[cp] = (cells[cp] + 2) % 256;
        break;
      case 'I':
        cells[cp] = (cells[cp] - 2 + 256) % 256;
        break;
      case 'V':
        cells[cp] = ~~(cells[cp] / 2);
        break;
      case 'A':
        cells[cp] = (cells[cp] + mem) % 256;
        break;
      case 'B':
        cells[cp] = (cells[cp] - mem + 256) % 256;
        break;
      case 'Y':
        cells[cp] = (cells[cp] * mem) % 256;
        break;
      case 'D':
        cells[cp] = ~~(cells[cp] / mem);
        break;
      default:
        break;
    }
    sp++;
  }
  return out;
}
