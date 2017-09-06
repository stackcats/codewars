function interpreter(code, iterations, width, height) {
  console.log(code, iterations, width, height);
  const grid = new Array(height);
  for (let i = 0; i < height; i++) {
    grid[i] = [];
    for (let j = 0; j < width; j++) {
      grid[i][j] = 0;
    }
  }
  let i = 0;
  let j = 0;
  let cp = 0;
  let ip = 0;
  while (ip < iterations && cp < code.length) {
    const c = code[cp];
    switch (c) {
      case 'n':
        i = (i - 1 + height) % height;
        break;
      case 'e':
        j = (j + 1) % width;
        break;
      case 's':
        i = (i + 1) % height;
        break;
      case 'w':
        j = (j - 1 + width) % width;
        break;
      case '*':
        grid[i][j] = grid[i][j] ? 0 : 1;
        break;
      case '[':
        if (!grid[i][j]) {
          let ct = 0;
          while (!(code[cp] == ']' && ct == 1)) {
            if (code[cp] == ']') ct--;
            else if (code[cp] == '[') ct++;
            cp++;
          }
        }
        break;
      case ']':
        if (grid[i][j]) {
          let ct = 0;
          while (!(code[cp] == '[' && ct == 1)) {
            if (code[cp] == ']') ct++;
            else if (code[cp] == '[') ct--;
            cp--;
          }
        }
        break;
      default:
        ip--;
        break;
    }
    cp++;
    ip++;
  }

  return grid.map(row => row.join('')).join('\r\n');
}

