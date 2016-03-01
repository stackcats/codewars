
String.prototype.toAscii85 = function() {
  // encode this string as ASCII85
  var str = this.slice(0);
  var buffer = new Buffer(str, 'utf8');
  var dataLength = buffer.length;
  var padding = (dataLength % 4 === 0) ? 0 : 4 - dataLength % 4;
  var result = '';
  for (var i = 0; i < dataLength; i += 4) {
    var num = (buffer[i] << 24) >>> 0;
    // pad '\0' (0)
    num += ((i + 1 > dataLength ? 0 : buffer[i + 1]) << 16) >>> 0;
    num += ((i + 2 > dataLength ? 0 : buffer[i + 2]) <<  8) >>> 0;
    num += ((i + 3 > dataLength ? 0 : buffer[i + 3]) <<  0) >>> 0;

    var block = [];
    for (var j = 0; j < 5; j++) {
      block.unshift(String.fromCharCode(num%85+33));
      num = Math.floor(num / 85);
    }
    block = block.join('');
    
    if (block === '!!!!!' && this.length >= 4)
      block = 'z';
    
    result += block;
  }
  return '<~' + result.substring(0, result.length - padding) + '~>';
};

String.prototype.fromAscii85 = function() {
  // decode this string from ASCII85
  var str = this.substr(2, this.length-4).replace(/\s/g, '');
  var buffer = new Buffer(str.replace('z', '!!!!!'), 'utf8');
  var dataLength = buffer.length;
  var padding = (dataLength % 5 === 0) ? 0 : 5 - dataLength % 5;
  var result = new Buffer(4 * Math.ceil((dataLength) / 5));
  for (var i = 0, ndx = 0; i < dataLength; i += 5, ndx += 4) {
    var num = 0;
    num = (buffer[i] - 33) * 85 * 85 * 85 * 85;
    // pad 'u' (84)
    num += (i+1 >= dataLength ? 84 : buffer[i+1] - 33) * 85 * 85 * 85;
    num += (i+2 >= dataLength ? 84 : buffer[i+2] - 33) * 85 * 85;
    num += (i+3 >= dataLength ? 84 : buffer[i+3] - 33) * 85;
    num += (i+4 >= dataLength ? 84 : buffer[i+4] - 33);
    result.writeUInt32BE(num, ndx);
  }
  return result.slice(0, ndx - padding).toString();
};
