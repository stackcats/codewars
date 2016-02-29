function processImage(imageData, height, width, weights){
  var outImageData = [];
  for(var i = 0; i < height; i++) {
    for(var j = 0; j < width; j++) {
      var data = adjust(imageData, i, j, height, width, weights);
      setData(data, outImageData, i, j, height, width);
    }
  }
  return outImageData;
}

function adjust(imageData, i, j, height, width, weights) {
  var ans = [0, 0, 0];
  
  var N = weights.length;
  for(var r = i - Math.floor(N/2), rt = 0; rt < N; r++, rt++) {
    for(var c = j - Math.floor(N/2), ct = 0; ct < N; c++, ct++) {
      var data = getData(imageData, r, c, height, width);
      var t = weights[rt][ct];
      ans[0] += data[0] * t;
      ans[1] += data[1] * t;
      ans[2] += data[2] * t;
    }
  }
  ans[0] = Math.round(ans[0]);
  if(ans[0] < 0) ans[0] = 0;
  if(ans[0] > 255) ans[0] = 255;
  
  ans[1] = Math.round(ans[1]);
  if(ans[1] < 0) ans[1] = 0;
  if(ans[1] > 255) ans[1] = 255;
  
  ans[2] = Math.round(ans[2]);
  if(ans[2] < 0) ans[2] = 0;
  if(ans[2] > 255) ans[2] = 255;
  
  return ans;
}

function getData(imageData, i, j, height, width) {
  var idx = getIndex(i, j, height, width);
  return [imageData[idx], imageData[idx+1], imageData[idx+2]];
}

function setData(data, imageData, i, j, height, width) {
  var idx = getIndex(i, j, height, width);
  imageData[idx] = data[0];
  imageData[idx+1] = data[1];
  imageData[idx+2] = data[2];
}

function getIndex(i, j, height, width) {
  if(i < 0)
    i = 0;
  if(j < 0)
    j = 0;
  if(i >= height)
    i = height - 1;
  if(j >= width)
    j = width - 1;
  return i * 3 * width + j * 3;
}

