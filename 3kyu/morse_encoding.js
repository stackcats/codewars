const zero32 = '00000000000000000000000000000000';

function rebit(s) {
  return s === '1' ? '0' : '1';
}

function btoi(s) {
  s = (s + zero32).substr(0, 32);
  if (s[0] === '0') {
    return parseInt(s, 2);
  }
  s = s.split('').map(rebit).join('');
  return -1 * (parseInt(s, 2) + 1);
}

function itob(n) {
  const sign = n < 0 ? -1 : 1;
  if (sign === 1) {
    const s = zero32 + n.toString(2);
    return s.substr(-32);
  }
  n = -n - 1;
  const s = (zero32 + n.toString(2)).substr(-32);
  return s.split('').map(rebit).join('');
}

const Morse = {};

Morse.encode = function encode(message) {
  // ·–·–·– ·–·–·– ·–·–·–
  const arr = message.split(' ');
  const bits = [];
  for (const word of arr) {
    const chs = word.split('');
    const bit = [];
    for (const ch of chs) {
      bit.push(this.alpha[ch]);
    }
    bits.push(bit.join('000'));
  }
  const str = bits.join('0000000');
  const ans = [];
  for (let i = 0; i < str.length; i += 32) {
    ans.push(btoi(str.slice(i, i + 32)));
  }
  return ans;
};

Morse.decode = function decode(integerArray) {
  const s = integerArray.map(itob).join('');
  const words = s.split('0000000');
  const ans = [];
  const nums = {};
  const alpha = this.alpha;
  Object.keys(alpha).forEach(k => {
    nums[alpha[k]] = k;
  });
  for (const w of words) {
    const word = [];
    const chs = w.split('000');
    for (const c of chs) {
      word.push(nums[c]);
    }
    ans.push(word.join(''));
  }
  return ans.filter(a => !/^\s*$/.test(a)).join(' ');
};

Morse.alpha = {
  'A': '10111',
  'B': '111010101',
  'C': '11101011101',
  'D': '1110101',
  'E': '1',
  'F': '101011101',
  'G': '111011101',
  'H': '1010101',
  'I': '101',
  'J': '1011101110111',
  'K': '111010111',
  'L': '101110101',
  'M': '1110111',
  'N': '11101',
  'O': '11101110111',
  'P': '10111011101',
  'Q': '1110111010111',
  'R': '1011101',
  'S': '10101',
  'T': '111',
  'U': '1010111',
  'V': '101010111',
  'W': '101110111',
  'X': '11101010111',
  'Y': '1110101110111',
  'Z': '11101110101',
  '0': '1110111011101110111',
  '1': '10111011101110111',
  '2': '101011101110111',
  '3': '1010101110111',
  '4': '10101010111',
  '5': '101010101',
  '6': '11101010101',
  '7': '1110111010101',
  '8': '111011101110101',
  '9': '11101110111011101',
  '.': '10111010111010111',
  ',': '1110111010101110111',
  '?': '101011101110101',
  "'": '1011101110111011101',
  '!': '1110101110101110111',
  '/': '1110101011101',
  '(': '111010111011101',
  ')': '1110101110111010111',
  '&': '10111010101',
  ':': '11101110111010101',
  ';': '11101011101011101',
  '=': '1110101010111',
  '+': '1011101011101',
  '-': '111010101010111',
  '_': '10101110111010111',
  '"': '101110101011101',
  '$': '10101011101010111',
  '@': '10111011101011101',
  ' ': '0' // Technically is 7 0-bits, but we assume that a space will always be between two other characters
};
