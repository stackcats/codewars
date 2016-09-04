// 堆的实现效率比较低 需要优化
class Node {
  constructor(x, y, weight) {
    this.x = x;
    this.y = y;
    this.weight = weight;
    this.f = 0;
    this.g = 0;
    this.h = 0;
    this.visited = false;
    this.closed = false;
    this.parent = null;
  }

  isWall() {
    return this.weight === 0;
  }
}

class Graph {
  constructor(s) {
    const row = Math.sqrt(s.length);
    const col = row;
    this.grid = new Array(row);
    let ndx = 0;
    for (let i = 0; i < row; i++) {
      this.grid[i] = [];
      for (let j = 0; j < col; j++) {
        const ch = s[ndx++];
        const weight = ch !== '#' ? 1 : 0;
        const node = new Node(i, j, weight);
        this.grid[i][j] = node;
        if (ch === 'S') this.start = node;
        else if (ch === 'T') this.end = node;
      }
    }
  }

  getStart() {
    return this.start;
  }

  getEnd() {
    return this.end;
  }

  neighbors(node) {
    const arr = [];
    const { x, y } = node;
    const grid = this.grid;

    if (grid[x] && grid[x][y + 1]) {
      arr.push(grid[x][y + 1]);
    }

    if (grid[x + 1] && grid[x + 1][y]) {
      arr.push(grid[x + 1][y]);
    }

    if (grid[x - 1] && grid[x - 1][y]) {
      arr.push(grid[x - 1][y]);
    }

    if (grid[x] && grid[x][y - 1]) {
      arr.push(grid[x][y - 1]);
    }

    return arr.reverse();
  }
}

class Heap {
  constructor(f) {
    this.content = [0];
    this.scoreFunc = f;
    this.count = 0;
  }

  push(node) {
    this.content.push(node);
    this.count++;
    this.down(this.count);
  }

  pop() {
    const res = this.content[1];
    this.content[1] = this.content[this.count];
    this.count -= 1;
    this.content.pop();
    this.up(1);
    return res;
  }

  size() {
    return this.count;
  }

  rebuild(node) {
    this.down(this.content.indexOf(node));
  }

  down(i) {
    while (~~(i / 2) > 0) {
      if (this.scoreFunc(this.content[i]) < this.scoreFunc(this.content[~~(i / 2)])) {
        const tmp = this.content[~~(i / 2)];
        this.content[~~(i / 2)] = this.content[i];
        this.content[i] = tmp;
      }
      i = ~~(i / 2);
    }
  }

  up(i) {
    while (i * 2 <= this.count) {
      const mc = this.minChild(i);
      if (this.scoreFunc(this.content[i]) > this.scoreFunc(this.content[mc])) {
        const tmp = this.content[i];
        this.content[i] = this.content[mc];
        this.content[mc] = tmp;
      }
      i = mc;
    }
  }

  minChild(i) {
    if (i * 2 + 1 > this.count) {
      return i * 2;
    }
    if (this.scoreFunc(this.content[i * 2]) < this.scoreFunc(this.content[i * 2 + 1])) {
      return i * 2;
    }
    return i * 2 + 1;
  }
}

function distance(a, b, start) {
  // 估价函数需要考虑转向步数
  const dx = a.x - start.x;
  const dy = a.y - start.y;
  let res;
  if (dx <= 0 && dy === 0) {
    res = 0;
  } else if (dx <= 0) {
    res = Math.abs(dy);
  } else {
    res = 2;
  }
  return Math.abs(a.x - b.x) + Math.abs(a.y - b.y) + res;
}

function pathTo(node) {
  const path = [];
  while (node.parent) {
    path.unshift([node.x, node.y]);
    node = node.parent;
  }
  path.unshift([node.x, node.y]);
  return path;
}

function astar(graph, start, end) {
  const openHeap = new Heap(n => n.f);
  start.h = distance(start, end, start);
  openHeap.push(start);

  while (openHeap.size() > 0) {
    const currentNode = openHeap.pop();
    if (currentNode === end) {
      return pathTo(currentNode);
    }

    currentNode.closed = true;

    const neighbors = graph.neighbors(currentNode);

    for (const neighbor of neighbors) {
      if (neighbor.closed || neighbor.isWall()) {
        continue;
      }

      const gScore = currentNode.g + neighbor.weight;
      const beenVisited = neighbor.visited;
      if (!beenVisited || gScore < neighbor.g) {
        neighbor.visited = true;
        neighbor.parent = currentNode;
        neighbor.h = neighbor.h || distance(neighbor, end, start);
        neighbor.g = gScore;
        neighbor.f = neighbor.h + neighbor.g;

        if (!beenVisited) {
          openHeap.push(neighbor);
        } else {
          openHeap.rebuild(neighbor);
        }
      }
    }
  }
  return [];
}

function pathDetail(path) {
  const cmds = [];
  let dir = 'n';
  for (let i = 0; i < path.length - 1; i++) {
    const curr = path[i];
    const next = path[i + 1];
    const dx = next[0] - curr[0];
    const dy = next[1] - curr[1];
    switch (dir) {
      case 'n':
        if (dy === -1) {
          cmds.push('l');
          dir = 'w';
        } else if (dy === 1) {
          cmds.push('r');
          dir = 'e';
        } else if (dx === 1) {
          cmds.push('r');
          cmds.push('r');
          dir = 's';
        }
        cmds.push('f');
        break;
      case 'e':
        if (dx === -1) {
          cmds.push('l');
          dir = 'n';
        } else if (dx === 1) {
          cmds.push('r');
          dir = 's';
        } else if (dy === -1) {
          cmds.push('r');
          cmds.push('r');
          dir = 'w';
        }
        cmds.push('f');
        break;
      case 's':
        if (dy === -1) {
          cmds.push('r');
          dir = 'w';
        } else if (dy === 1) {
          cmds.push('l');
          dir = 'e';
        } else if (dx === -1) {
          cmds.push('r');
          cmds.push('r');
          dir = 'n';
        }
        cmds.push('f');
        break;
      case 'w':
        if (dx === -1) {
          cmds.push('r');
          dir = 'n';
        } else if (dx === 1) {
          cmds.push('l');
          dir = 's';
        } else if (dy === 1) {
          cmds.push('r');
          cmds.push('r');
          dir = 'e';
        }
        cmds.push('f');
        break;
      default:
        break;
    }
  }
  return cmds;
}

function getCommands(field, power) {
  const g = new Graph(field);
  const path = astar(g, g.getStart(), g.getEnd());
  const ans = pathDetail(path);
  return ans.length > power ? [] : ans;
}

console.log(getCommands('S.......T', 20));
