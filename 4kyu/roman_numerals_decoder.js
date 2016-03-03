function solution(roman){
  // complete the solution by transforming the 
  // string roman numeral into an integer
  var ans = 0;
  var i = 0;
  var len = roman.length;
  while(i < len) {
    if(roman[i] == 'M') {
      ans += 1000;
    } else if(roman[i] == 'C') {
      if(roman[i+1] && roman[i+1] == 'M') {
	ans += 900;
	i++;
      } else if(roman[i+1] && roman[i+1] == 'D') {
	ans += 400;
	i++;
      } else {
	ans += 100;
      }
    } else if(roman[i] == 'D') {
      ans += 500;
    } else if(roman[i] == 'L') {
      ans += 50;
    } else if(roman[i] == 'V') {
      ans += 5;
    } else if(roman[i] == 'X') {
      if(roman[i+1] && roman[i+1] == 'L') {
	ans += 40;
	i++;
      } else if(roman[i+1] && roman[i+1] == 'C') {
	ans += 90;
	i++;
      } else {
	ans += 10;
      }
    } else if(roman[i] == 'I') {
      if(roman[i+1] && roman[i+1] == 'V') {
	ans += 4;
	i++;
      } else if(roman[i+i] && roman[i+1] == 'X') {
	ans += 9;
	i++;
      } else {
	ans += 1;
      }
    }
    i++;
  }

  return ans;
}
