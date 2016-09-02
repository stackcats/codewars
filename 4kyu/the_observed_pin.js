function getPINs(observed) {
  const arr = [];
  for (let i = 0; i < observed.length; i++) {
    const ch = observed[i];
    switch (ch) {
      case '1':
        arr.push(['1', '2', '4']);
        break;
      case '2':
        arr.push(['1', '2', '5', '3']);
        break;
      case '3':
        arr.push(['2', '3', '6']);
        break;
      case '4':
        arr.push(['1', '4', '5', '7']);
        break;
      case '5':
        arr.push(['2', '4', '5', '6', '8']);
        break;
      case '6':
        arr.push(['3', '5', '6', '9']);
        break;
      case '7':
        arr.push(['4', '7', '8']);
        break;
      case '8':
        arr.push(['5', '7', '8', '9', '0']);
        break;
      case '9':
        arr.push(['6', '8', '9']);
        break;
      case '0':
        arr.push(['0', '8']);
        break;
      default:
        break;
    }
  }
  return perm(arr);
}
function perm (arr) {
  if (!arr || !arr.length) return [];
  if (arr.length === 1) return arr[0];
  const last = arr.pop();
  const elem = arr.pop();
  console.log(last, elem);
  let ans = [];
  for (const e of elem) {
    const a = last.map(x => `${e}${x}`);
    ans = ans.concat(a);
  }
  arr.push(ans);
  return perm(arr);
}
