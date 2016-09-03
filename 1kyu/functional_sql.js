function dummy(a) {
  return a;
}

function groupHelper(funcs, arr) {
  // 递归按顺序分组
  if (!funcs.length) return arr;
  const func = funcs[0];
  const group = new Set();
  for (const d of arr) {
    group.add(func(d));
  }
  arr = Array.from(group).map(g => [g, arr.filter(d => func(d) === g)]);
  const restFuncs = funcs.slice(1);
  return arr.map(a => [a[0], groupHelper(restFuncs, a[1])]);
}

function join(arr) {
  // 先进行全连接 方便where过滤
  if (!arr || !arr.length) return [];
  if (arr.length === 1) return arr[0];
  const last = arr.pop();
  const elem = arr.pop();
  const ans = [];
  for (const e of elem) {
    last.forEach(x => {
      if (Array.isArray(x)) {
        const tmp = x.slice(0);
        tmp.unshift(e);
        ans.push(tmp);
      } else {
        ans.push([e, x]);
      }
    });
  }
  arr.push(ans);
  return join(arr);
}

class SQL {
  constructor() {
    this.data = undefined;
    this.ops = {
      select: undefined,
      where: undefined,
      groupBy: undefined,
      orderBy: undefined,
      having: undefined
    };
  }

  select(func) {
    if (this.ops.select !== undefined) {
      throw new Error('Duplicate SELECT');
    }
    this.ops.select = func || dummy;
    return this;
  }

  from(...data) {
    if (this.data !== undefined) {
      throw new Error('Duplicate FROM');
    }
    this.data = join(data) || [];
    return this;
  }

  where(...func) {
    // where方法格式为 [[a OR b] AND [c OR d]]
    // 同一次的输入参数为OR, 其它为AND
    if (this.ops.where !== undefined) {
      this.ops.where.push(func);
    } else {
      this.ops.where = [func];
    }
    return this;
  }

  groupBy(...func) {
    if (this.ops.groupBy !== undefined) {
      throw new Error('Duplicate GROUPBY');
    }
    this.ops.groupBy = func;
    return this;
  }

  orderBy(func) {
    if (this.ops.orderBy !== undefined) {
      throw new Error('Duplicate ORDERBY');
    }
    this.ops.orderBy = func;
    return this;
  }

  having(...func) {
    if (this.ops.having !== undefined) {
      this.ops.having.push(func);
    } else {
      this.ops.having = [func];
    }
    return this;
  }

  execute() {
    // 每个方法的执行顺序不能错
    if (!this.data) return [];

    if (this.ops.where) {
      for (const funcs of this.ops.where) {
        const s = new Set();
        for (const f of funcs) {
          const tmp = this.data.filter(f);
          for (const t of tmp) {
            s.add(t);
          }
        }
        this.data = [...s];
      }
    }

    if (this.ops.groupBy) {
      this.data = groupHelper(this.ops.groupBy, this.data);
    }

    if (this.ops.having) {
      for (const funcs of this.ops.having) {
        const s = new Set();
        for (const f of funcs) {
          const tmp = this.data.filter(f);
          for (const t of tmp) {
            s.add(t);
          }
        }
        this.data = [...s];
      }
    }

    if (this.ops.select) {
      this.data = this.data.map(this.ops.select);
    }

    if (this.ops.orderBy) {
      this.data = this.data.sort(this.ops.orderBy);
    }
    return this.data;
  }
}

function query() {
  return new SQL();
}
