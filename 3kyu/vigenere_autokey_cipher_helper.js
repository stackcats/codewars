// 只有在abc中的字符才添加到key中!!
function VigenèreAutokeyCipher(key, abc) {
  this.encode = function encode(str) {
    let ans = '';
    const nkey = key.split('');
    for (const c of str) {
      if (abc.indexOf(c) !== -1) {
        nkey.push(c);
      }
    }
    for (let i = 0; i < str.length; i++) {
      const c = str[i];
      let ch = '';
      if (abc.indexOf(c) === -1) {
        ch = c;
      } else {
        const p = nkey.shift();
        ch = abc[(abc.indexOf(p) + abc.indexOf(c)) % abc.length];
      }
      ans += ch;
    }
    return ans;
  };
  this.decode = function decode(str) {
    let ans = '';
    const nkey = key.split('');
    for (let i = 0; i < str.length; i++) {
      const c = str[i];
      let ch = '';
      if (abc.indexOf(c) === -1) {
        ch = c;
      } else {
        const p = nkey.shift();
        const ndx = (abc.indexOf(c) - abc.indexOf(p) + abc.length) % abc.length;
        ch = abc[ndx];
      }
      ans += ch;
      if (abc.indexOf(ch) !== -1) {
        nkey.push(ch);
      }
    }
    return ans;
  };
}
