import 'dart:math';

const lowerBoard = {
  'a': [0, 0],
  'b': [0, 1],
  'c': [0, 2],
  'd': [0, 3],
  'e': [0, 4],
  '1': [0, 5],
  '2': [0, 6],
  '3': [0, 7],

  'f': [1, 0],
  'g': [1, 1],
  'h': [1, 2],
  'i': [1, 3],
  'j': [1, 4],
  '4': [1, 5],
  '5': [1, 6],
  '6': [1, 7],

  'k': [2, 0],
  'l': [2, 1],
  'm': [2, 2],
  'n': [2, 3],
  'o': [2, 4],
  '7': [2, 5],
  '8': [2, 6],
  '9': [2, 7],

  'p': [3, 0],
  'q': [3, 1],
  'r': [3, 2],
  's': [3, 3],
  't': [3, 4],
  '.': [3, 5],
  '@': [3, 6],
  '0': [3, 7],

  'u': [4, 0],
  'v': [4, 1],
  'w': [4, 2],
  'x': [4, 3],
  'y': [4, 4],
  'z': [4, 5],
  '_': [4, 6],
  '/': [4, 7],

  'aA': [5, 0],
  ' ': [5, 1]
};

const upperBoard = {
  'A': [0, 0],
  'B': [0, 1],
  'C': [0, 2],
  'D': [0, 3],
  'E': [0, 4],
  '1': [0, 5],
  '2': [0, 6],
  '3': [0, 7],

  'F': [1, 0],
  'G': [1, 1],
  'H': [1, 2],
  'I': [1, 3],
  'J': [1, 4],
  '4': [1, 5],
  '5': [1, 6],
  '6': [1, 7],

  'K': [2, 0],
  'L': [2, 1],
  'M': [2, 2],
  'N': [2, 3],
  'O': [2, 4],
  '7': [2, 5],
  '8': [2, 6],
  '9': [2, 7],

  'P': [3, 0],
  'Q': [3, 1],
  'R': [3, 2],
  'S': [3, 3],
  'T': [3, 4],
  '.': [3, 5],
  '@': [3, 6],
  '0': [3, 7],

  'U': [4, 0],
  'V': [4, 1],
  'W': [4, 2],
  'X': [4, 3],
  'Y': [4, 4],
  'Z': [4, 5],
  '_': [4, 6],
  '/': [4, 7],

  'aA': [5, 0],
  ' ': [5, 1]
};

const symbolBoard = {
  '^': [0, 0],
  '~': [0, 1],
  '?': [0, 2],
  '!': [0, 3],
  '\'': [0, 4],
  '"': [0, 5],
  '(': [0, 6],
  ')': [0, 7],

  '-': [1, 0],
  ':': [1, 1],
  ';': [1, 2],
  '+': [1, 3],
  '&': [1, 4],
  '%': [1, 5],
  '*': [1, 6],
  '=': [1, 7],

  '<': [2, 0],
  '>': [2, 1],
  '€': [2, 2],
  '£': [2, 3],
  '\$': [2, 4],
  '¥': [2, 5],
  '¤': [2, 6],
  '\\': [2, 7],

  '[': [3, 0],
  ']': [3, 1],
  '{': [3, 2],
  '}': [3, 3],
  ',': [3, 4],
  '.': [3, 5],
  '@': [3, 6],
  '§': [3, 7],

  '#': [4, 0],
  '¿': [4, 1],
  '¡': [4, 2],
  '_': [4, 6],
  '/': [4, 7],

  'aA': [5, 0],
  ' ': [5, 1]
};

const keyBoard = {
  0: lowerBoard,
  1: upperBoard,
  2: symbolBoard,
};


int numberOfChangeMode(int a, int b) {
  return (b - a + 3) % 3;
}

int distance(List<int> a, List<int> b, { int numberOfPress = 1 }) {
  List<int> arr = [
    (a[0] - b[0]).abs() + (a[1] - b[1]).abs(),
    (a[0]  - (b[0] + 6)).abs() + (a[1] - b[1]).abs(),
    (a[0] - b[0]).abs() + (a[1] - (b[1] + 8)).abs(),
    (a[0] - (b[0] + 6)).abs() + (a[1] - (b[1] + 8)).abs(),
    (a[0]  - (b[0] - 6)).abs() + (a[1] - b[1]).abs(),
    (a[0] - b[0]).abs() + (a[1] - (b[1] - 8)).abs(),
    (a[0] - (b[0] - 6)).abs() + (a[1] - (b[1] - 8)).abs(),
    (a[0] - (b[0] - 6)).abs() + (a[1] - (b[1] + 8)).abs(),
    (a[0] - (b[0] + 6)).abs() + (a[1] - (b[1] - 8)).abs(),
  ];
  return arr.reduce((x, y) => min(x, y)) + numberOfPress;
}


int nextMode(int preMode, String currentChar) {
  if (keyBoard[preMode].containsKey(currentChar)) {
    return preMode;
  }
  int nextMode = (preMode + 1) % 3;
  if (keyBoard[nextMode].containsKey(currentChar)) {
    return nextMode;
  }
  return (nextMode + 1) % 3;
}

int tv_remote(String word) {
  int dis = 0;
  word = 'a' + word;
  int preMode = 0;
  for (int i = 1; i < word.length; i++) {
    int d = 0;
    int currentMode = nextMode(preMode, word[i]);
    if (preMode != currentMode) {
      int numberOfPress = numberOfChangeMode(preMode, currentMode);
      d += distance(keyBoard[preMode][word[i-1]], keyBoard[preMode]['aA'], numberOfPress: numberOfPress);
      d += distance(keyBoard[currentMode]['aA'], keyBoard[currentMode][word[i]]);
      preMode = currentMode;
    } else {
      d += distance(keyBoard[preMode][word[i-1]], keyBoard[preMode][word[i]]);
    }
    dis += d;

  }
  return dis;
}
