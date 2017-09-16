function solveExpression(exp) {
  exp = exp.replace(/[-+*]/g, (m) => ` ${m} `);
  let [left, right] = exp.split('=');
  for (let i = 0; i < 10; i++) { 
    if (exp.indexOf(String(i)) !== -1) continue;
    const lp = left.replace(/\?/g, i);  
    const rp = right.replace(/\?/g, i);
    if (/^0{2}/.test(lp) || /^0{2}/.test(rp)) continue;
    if (eval(lp)== rp.replace(/\s/g, '')) return i;
  }
  return -1;
}
