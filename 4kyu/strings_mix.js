Set.prototype.intersection = function(setB) {
  var intersection = new Set();
  for (var elem of setB) {
    if (this.has(elem)) {
      intersection.add(elem);
    }
  }
  return intersection;
}

function count(s) {
  const obj = {};
  for (let i = 0; i < s.length; i++) {
    const ch = s[i];
    if (/[a-z]/.test(ch)) {
      if (obj[ch] === undefined) {
        obj[ch] = ch;
      } else {
        obj[ch] += ch;
      }
    }
  }
  
  const arr = [];
  Object.keys(obj).forEach((attr) => {
    if (obj[attr].length > 1)
      arr.push(obj[attr]);
  });
  
  return arr.sort((a, b) => {
    if (a.length === b.length) {
      if (a < b) return -1;
      if (a > b) return 1;
    }
    return b.length - a.length;
  });
}
function mix(s1, s2) {
  const a1 = count(s1);
  const a2 = count(s2);
  const set = (new Set(a1)).intersection(new Set(a2));
  const arr = [];
  const eq = [];
  let i = 0;
  let j = 0;
  const re = {};
  while (i < a1.length && j < a2.length) {
    const c1 = a1[i];
    const c2 = a2[j];
    if (re[c1[0]]) {
      i++;
      continue;
    }
    if (re[c2[0]]) {
      j++;
      continue;
    }
    if (set.has(c1)) {
      eq.push(`=:${c1}`);
      i++;
      continue;
    }
    if (set.has(c2)) {
      j++;
      continue;
    }

    if (c1.length >= c2.length) {
      arr.push(`1:${c1}`);
      re[c1[0]] = 1;
      i++;
    } else {
      re[c2[0]] = 1;
      arr.push(`2:${c2}`);
      j++;
    }
  }
  
  while (i < a1.length) {
    if (re[a1[i][0]]) {
      i++;
      continue;
    }
    if (set.has(a1[i])) {
      eq.push(`=:${a1[i++]}`);
    } else {
      arr.push(`1:${a1[i++]}`);
    }
  }
  
  while (j < a2.length) {
    if (re[a2[j][0]]) {
      j++;
      continue;
    }
    if (set.has(a2[j])) {
      j++;
    } else {
      arr.push(`2:${a2[j++]}`);
    }
  }
  
  const ans = [];
  i = 0;
  j = 0;
  while (i < arr.length && j < eq.length) {
    if (arr[i].length >= eq[j].length) {
      ans.push(arr[i++]);
    } else {
      ans.push(eq[j++]);
    }
  }
  
  while (i < arr.length) {
    ans.push(arr[i++]);
  }
  
  while (j < eq.length) {
    ans.push(eq[j++]);
  }
  return ans.join('/');
}
