function solution(number){
  // convert the number to a roman numeral
  var r = [1000, 900, 800, 700, 600, 500, 400, 300, 200, 100,
           90, 80, 70, 60, 50, 40, 30, 20, 10,
           9, 8, 7, 6, 5, 4, 3, 2, 1];
  
  var n = ['M', 'CM', 'DCCC', 'DCC', 'DC', 'D', 'CD', 'CCC', 'CC', 'C',
           'XC', 'LXXX', 'LXX', 'LX', 'L', 'XL', 'XXX', 'XX', 'X',
           'IX', 'VIII', 'VII', 'VI', 'V', 'IV', 'III', 'II', 'I'];
  var ans = '';
  while(number > 0) {
    for(var i = 0; i < r.length; i++) {
      if(r[i] <= number) {
        ans += n[i];
        number -= r[i];
        break;
      }
    }
  }
  return ans;
}
