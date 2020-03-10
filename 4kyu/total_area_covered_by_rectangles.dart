import 'dart:math';

List<int> arr = [];

class Node {
  int start;
  int end;
  int covered = 0;
  int length = 0;
  Node _left;
  Node _right;

  Node(this.start, this.end);

  int get mid => (start + end) ~/ 2;

  Node get left {
    if (_left == null) {
      _left = Node(start, mid);
    }
    return _left;
  }

  Node get right {
    if (_right == null) {
      _right = Node(mid, end);
    }
    return _right;
  }

  int update(int l, int r, int val) {
    if (l >= r) {
      return 0;
    }

    if (start == l && end == r) {
      covered += val;
    } else {
      left.update(l, min(mid, r), val);
      right.update(max(mid, l), r, val);
    }

    if (covered > 0) {
      length = arr[end] - arr[start];
    } else {
      length = left.length + right.length;
    }

    return length;
  }
}

int calculate(List<List<int>> rectangles) {
  if (rectangles.length == 0) return 0;
  Set<int> s = Set();
  List<List<int>> events = [];
  for (int i = 0; i < rectangles.length; i++) {
    var rect = rectangles[i];
    int x1 = rect[0];
    int y1 = rect[1];
    int x2 = rect[2];
    int y2 = rect[3];
    s.add(x1);
    s.add(x2);
    events.add([y1, x1, x2, 1]);
    events.add([y2, x1, x2, -1]);
  }

  events.sort((a, b) => a[0].compareTo(b[0]));

  arr = s.toList();
  arr.sort();
  Map<int, int> m = {};
  for (int i = 0; i < arr.length; i++) {
    m[arr[i]] = i;
  }
  Node sgt = Node(0, arr.length - 1);

  int ans = 0;
  int curX = 0;
  int curY = events[0][0];
  for (int i = 0; i < events.length; i++) {
    var ev = events[i];
    int y = ev[0];
    int x1 = ev[1];
    int x2 = ev[2];
    int val = ev[3];
    ans += curX * (y - curY);
    curX = sgt.update(m[x1], m[x2], val);
    curY = y;
  }
  return ans;
}
