function fb(s) {
  let ans = 0;
  for (let i = s.length - 1; i >= 0; i--) {
    const p = s.length - i - 1;
    if (s[i] === '1') {
      ans += Math.pow(-2, p);
    }
  }
  return ans;
}

function fd(n) {
  const Schroeppel2 = 0xAAAAAAAA;
  return ((n + Schroeppel2) ^ Schroeppel2).toString(2);
}

function skrzat(type, input) {
  return type === 'b' ? `From binary: ${input} is ${fb(input)}`
    : `From decimal: ${input} is ${fd(input)}`;
}
