function sum(arr) {
  return arr.reduce((a, b) => a + b, 0);
}
function helper(arr, n) {
  const ans = [];
  const ar = [];
  const obj = {};
  const visited = [];
  for (let i = 0; i < arr.length; i++) {
    visited[i] = 0;
  }
  function dfs(step, start) {
    // console.log(step);
    if (step === n) {
      // console.log(ar);
      if (sum(ar) === 0) {
        // const x = ar.sort((a,b) => a - b);
        if (obj[ar] === undefined) {
          ans.push(ar.slice(0));
          obj[ar] = 1;
        }
      }
    }
    for (let i = start; i < arr.length; i++) {
      if (visited[i] === 0) {
        visited[i] = 1;
        if (ar.indexOf(arr[i]) !== -1) {
          continue;
        }
        ar.push(arr[i]);
        dfs(step + 1, i + 1);
        ar.pop();
        visited[i] = 0;
      }
    }
  }
  for (let i = 0; i < arr.length; i++) {
    dfs(0, i);
  }

  return ans;
}

function findZeroSumGroups(arr, n) {
  // your code here
  if (arr.length === 0) return 'No elements to combine';
  const ans = helper(arr.sort((a, b) => a - b), n);
  if (!ans.length) return 'No combinations';
  if (ans.length === 1) return ans[0];
  return ans;
}
