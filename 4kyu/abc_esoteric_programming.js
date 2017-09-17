class Interpreter {
  constructor() { 
  }
  
  read(input){
    input = input.split('');
    let acc = 0;
    let output = '';
    const debug = [];
    let ascii_mode = false;    
    for (let i = 0; i < input.length; i++) {
      switch(input[i]) {
        case 'a':
          acc++;
          break;
        case 'b':
          acc--;
          break;
        case 'c':
          if (ascii_mode) {
            output += String.fromCharCode(acc);
            console.log(acc);
          } else {
            output += acc;
          }
          break;
        case 'd':
          acc *= -1;
          break;
        case 'r':
          acc = ~~(acc * Math.random());
          break;
        case 'n':
          acc = 0;
          break;
        case '$':
          ascii_mode = !ascii_mode;
          break;
        case 'l':
          input.splice(i, 1);
          i = -1;
          break;
        case ';':
          debug.push(`${acc}->${String.fromCharCode(acc)}`);
          break;
          
      }
    }
    return { output, debug };
  }
}
