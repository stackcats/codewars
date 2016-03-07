/**
 * CSV Parser.  Takes a string as input and returns
 * an array of arrays (for each row).
 * 
 * @param input String, CSV input
 * @param separator String, single character used to separate fields.
 *        Defaults to ","
 * @param quote String, single character used to quote non-simple fields.
 *        Defaults to "\"".
 */
function parseCSV(input, separator, quote) {
  console.log(input);
  separator = separator || ',';
  quote = quote || '"';
  
  // Create your implementation here
  var quoteFlag = false;
  var i = 0;
  var il = input.length;
  var cell = '';
  var ans = [];
  var row = [];
  
  while(i < il) {
    var ch = input[i];
    // console.log(ch);
    if(quoteFlag) {
      if(ch == quote) {
        if(input[i+1] && input[i+1] == quote) {
          cell += quote;
          i++;
        } else {
          quoteFlag = false;
        }
      } else {
        cell += ch;
      }
      i++;
      continue;
    }
    
    switch(ch) {
    case separator:
      row.push(cell);
      cell = '';
      break;
    case '\n':
      row.push(cell);
      ans.push(row);
      row = [];
      cell = '';
      break;
    case quote:
      quoteFlag = true;
      break;
    default:
      cell += ch;
      break;
    }
    i += 1;
  }

  row.push(cell);
  ans.push(row);
  return ans;
}

