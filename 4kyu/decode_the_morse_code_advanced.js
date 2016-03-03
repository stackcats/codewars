function getStr(ch, n) {
  var ans = '';
  while(n-- > 0) {
    ans += ch;
  }
  return ans;
}
var decodeBits = function(bits){
  
  bits = bits.replace(/(^0*)|(0*$)/g, '');
  console.log(bits);
  // ToDo: Accept 0's and 1's, return dots, dashes and spaces
  var arr = bits.split(/0+/g);
  var len = 100;
  for(var i = 0; i < arr.length; i++) {
    //找到 . 的长度 长度最短的为.
    if(arr[i].length != 0 && len > arr[i].length) {
      len = arr[i].length;
    }
  }
  
  console.log(arr, len);
  arr = bits.split(/1+/g);
  for(var i = 0; i < arr.length; i++) {
    //找到 . 的长度 长度最短的为.
    if(arr[i].length != 0 && len > arr[i].length) {
      len = arr[i].length;
    }
  }
  
  console.log(arr, len);
  var dotReg = new RegExp(getStr('1', len), 'g');
  var dashReg = new RegExp(getStr('1', 3 * len), 'g');
  var wordSpaceReg = new RegExp(getStr('0', 7 * len), 'g');
  var chSpaceReg = new RegExp(getStr('0', 3 * len), 'g');
  var reg = new RegExp(getStr('0', len), 'g');
  
  var s = bits.replace(dashReg, '-').replace(dotReg, '.').replace(wordSpaceReg, '  ')
	.replace(chSpaceReg, ' ').replace(reg, '');

  
  return s;

}

var decodeMorse = function(morseCode){
  // ToDo: Accept dots, dashes and spaces, return human-readable message
  var arr = morseCode.split(' ');
  var ans = '';
  console.log(morseCode);
  var isSpace = false
  arr.forEach(function(a) {
    if(MORSE_CODE[a]) {
      ans += MORSE_CODE[a];
      isSpace = false;
    } else if(!isSpace) {
      ans += ' ';
      isSpace = true;
    } else
      ;
  });
  //console.log(MORSE_CODE);
  //.... . -.-- .--- ..- -.. .
  //···· · −·−− ·−−− ··− −·· ·
  return ans.replace(/(^\s*)|(\s*$)/g, '');
}
