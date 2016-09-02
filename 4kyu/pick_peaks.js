function pickPeaks(arr) {
  const pos = [];
  const peaks = [];
  console.log(arr);
  for (let i = 1; i < arr.length - 1; i++) {
    const left = findLeft(arr, i);
    const mid = arr[i];
    const right = findRight(arr, i);
    if (left < mid && mid > right) {
      let j = i;

      while (arr[--j] === arr[i]) ;

      if (++j > 0 && pos[pos.length - 1] !== j) {
        pos.push(j);
        peaks.push(mid);
      }
    }
  }
  return { pos, peaks };
}

function findLeft(arr, i) {
  let j = i - 1;
  while (j >= 0 && arr[j] === arr[i]) {
    j--;
  }
  if (j < 0) {
    return arr[i] + 1;
  }
  return arr[j];
}

function findRight(arr, i) {
  let j = i + 1;
  while (j < arr.length && arr[j] === arr[i]) {
    j++;
  }
  if (j === arr.length) {
    return arr[i] + 1;
  }
  return arr[j];
}
