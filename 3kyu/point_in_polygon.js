//Return true if point is inside poly, and false if it is not
//射线法
//向y轴上方做射线 穿过多边形边奇数次 则在多边形内
function pointInPoly(poly, point) {
  var times = 0;
  var slope, cond1, cond2, above;
  for(var i = 0, il = poly.length; i < il; i++) {
    var p1 = poly[i];
    var p2;
    if(i + 1 === il)
      p2 = poly[0]; 
    else 
      p2 = poly[i+1];
    var dx = p1[0] - p2[0];
    if(dx === 0) {
      above = point[1] < p1[1];
    } else {
      slope = (p1[1] - p2[1]) / dx;
      //slope * (point[0] - p2[0]) + p2[1]  根据直线公式 求该直线上x为point[0]的y
      above = point[1] < slope * (point[0] - p2[0]) + p2[1];
    }
    cond1 = p1[0] <= point[0] && point[0] < p2[0];
    cond2 = p2[0] <= point[0] && point[0] < p1[0];
    console.log(cond1, cond2, above);
    if((cond1 || cond2) && above)
      times++; 
  }
  return times % 2 === 1;
}
