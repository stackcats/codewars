class Heap {
  constructor() {
    this.arr = [0];
    this.count = 0;
  }

  add(n) {
    this.arr.push(n);
    this.count++;
    this.shiftUp(this.count);
  }

  first() {
    const val = this.arr[1];
    this.arr[1] = this.arr[this.count];
    this.count -= 1;
    this.arr.pop();
    this.shiftDown(1);
    return val;
  }

  shiftUp(i) {
    while (~~(i / 2) > 0) {
      if (this.arr[i] < this.arr[~~(i / 2)]) {
        const tmp = this.arr[~~(i / 2)];
        this.arr[~~(i / 2)] = this.arr[i];
        this.arr[i] = tmp;
      }
      i = ~~(i / 2);
    }
  }

  shiftDown(i) {
    while (i * 2 <= this.count) {
      const mc = this.minChild(i);
      if (this.arr[i] > this.arr[mc]) {
        const tmp = this.arr[i];
        this.arr[i] = this.arr[mc];
        this.arr[mc] = tmp;
      }
      i = mc;
    }
  }
  minChild(i) {
    if (i * 2 + 1 > this.count) {
      return i * 2;
    }
    if (this.arr[i * 2] < this.arr[i * 2 + 1]) {
      return i * 2;
    }
    return i * 2 + 1;
  }
  print() {
    console.log(this.arr);
  }
}

const ans = [];
function dblLinear(n) {
  // your code
  if (ans[n] !== undefined) {
    return ans[n];
  }
  const queue = new Heap();
  queue.add(1);
  let ct = 0;
  while (ct <= n) {
    const x = queue.first();
    const y = 2 * x + 1;
    const z = 3 * x + 1;
    if (ans.indexOf(x) === -1) {
      ans.push(x);
      ct++;
    }
    queue.add(y);
    queue.add(z);
  }

  return ans[n];
}
