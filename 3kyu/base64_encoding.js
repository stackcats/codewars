const table = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';

String.prototype.toBase64 = function toBase64() {
  let bits = '';
  const len = this.length;
  for (let i = 0; i < len; i++) {
    const bit = `00000000${this.charCodeAt(i).toString(2)}`;
    bits += bit.substr(-8);
  }
  if (len % 3 === 1) {
    bits += '0000000000000000'; // 16 0s
  } else if (len % 3 === 2) {
    bits += '00000000';
  }

  let ans = '';
  for (let i = 0; i < bits.length; i += 6) {
    const s = bits.slice(i, i + 6);
    const n = parseInt(s, 2);
    ans += table[n];
  }
  return ans;
};

String.prototype.fromBase64 = function fromBase64() {
  let bits = '';
  for (let i = 0; i < this.length; i++) {
    const n = table.indexOf(this[i]);
    const s = `000000${n.toString(2)}`;
    bits += s.substr(-6);
  }

  let ans = '';
  for (let i = 0; i < bits.length; i += 8) {
    const s = bits.slice(i, i + 8);
    const n = parseInt(s, 2);
    ans += String.fromCharCode(n);
  }
  return ans;
};
