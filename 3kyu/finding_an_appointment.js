function toM(s) {
  var h = parseInt(s.split(':')[0]);
  var m = parseInt(s.split(':')[1]);
  return (h - 9) * 60 + m;
}

function toHHMM(n) {
  var arr = ['09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19'];
  var MM = n % 60;
  if(MM < 10) {
    MM = '0' + MM;
  }
  var HH = Math.floor(n/60);
  return arr[HH]+':'+MM;
}

function getStartTime(schedules, duration) {
  // TODO
  var N = toM('19:00') - toM('09:00') + 1;
  var arr = new Array(N);
  
  var i;
  for( i = 0; i < N; i++)
    arr[i] = 0;
  
  arr[N-1] = 1;
  
  schedules.forEach(function(person) {
    person.forEach(function(m) {
      var start = toM(m[0]);
      var end = toM(m[1]);
      
      while(start < end)
        arr[start++] = 1;
    });
  });

  var ans = [];
  i = 0;
  while(i < N) {
    if(!arr[i]) {
      var t = {};
      t.start = i;
      while(i < N && !arr[i])
        i++;
      
      t.during = i - t.start;
      ans.push(t);
    } else {
      i++;
    }
  }
  
  for(i = 0; i < ans.length; i++) {
    var a = ans[i];
    if(a.during >= duration)
      return toHHMM(a.start);
  }
  
  return null;
}
