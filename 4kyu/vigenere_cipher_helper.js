function VigenèreCipher(key, abc) {
  this.encode = function encode(str) {
    let ans = '';
    for (let i = 0; i < str.length; i++) {
      const c = str[i];
      const p = key[i % key.length];
      if (abc.indexOf(c) === -1) {
        ans += c;
      } else {
        ans += abc[(abc.indexOf(p) + abc.indexOf(c)) % abc.length];
      }
    }
    return ans;
  };
  this.decode = function decode(str) {
    let ans = '';
    for (let i = 0; i < str.length; i++) {
      const c = str[i];

      const p = key[i % key.length];
      if (abc.indexOf(c) === -1 || abc.indexOf(p) === -1) {
        ans += c;
      } else {
        ans += abc[(abc.indexOf(c) - abc.indexOf(p) + abc.length) % abc.length];
      }
    }
    return ans;
  };
}
