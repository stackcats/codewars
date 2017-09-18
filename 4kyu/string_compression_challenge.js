// Average compression time: ?ms
// Average compression rate: ?%
// Average decompression time: ?ms
const zlib = require('zlib');

var Zipper = {
  compress: function(string) {
    if (string.length < 11) return string;
    return zlib.gzipSync(string).toString('base64');
  },
  decompress: function(string) {
    if (string.length < 11) return string;
    return zlib.gunzipSync(new Buffer(string, 'base64')).toString();
  }
};
