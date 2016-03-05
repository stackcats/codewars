function longestSlideDown (pyramid) {
  
  for(var i = 1; i < pyramid.length; i++) {
    var row = pyramid[i];
    pyramid[i][0] += pyramid[i-1][0];
    for(var j = 1; j < row.length - 1; j++) {
      pyramid[i][j] += Math.max(pyramid[i-1][j-1], pyramid[i-1][j]);
    }
    pyramid[i][j] += pyramid[i-1][j-1];
  }
  //console.log(pyramid);
  return Math.max.apply(null, pyramid[pyramid.length-1]);
}
