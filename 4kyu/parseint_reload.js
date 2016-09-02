const num = {
  zero: 0, one: 1, two: 2, three: 3, four: 4,
  five: 5, six: 6, seven: 7, eight: 8, nine: 9, ten: 10,
  twenty: 20, thirty: 30, forty: 40, fifty: 50, sixty: 60, seventy: 70,
  eighty: 80, ninety: 90
};

const obj = {
  hundred: 100,
  thousand: 1000,
  hundredthousand: 100000,
  million: 1000000
};
function parseInt(string) {
  const arr = string.replace(/ and /g, ' ').replace(/[-]/g, ' ').split(' ');
  const h = arr.indexOf('hundred');
  const t = arr.indexOf('thousand');
  if (h !== -1 && h < t) {
    arr[h] = 'hundredthousand';
  }
  let ans = 0;
  let tmp = 0;
  for (let i = 0; i < arr.length; i++) {
    const word = arr[i];
    if (num[word] !== undefined) {
      tmp += num[word];
    } else {
      tmp *= obj[word];
      ans += tmp;
      tmp = 0;
    }
  }
  return ans + tmp;
}
