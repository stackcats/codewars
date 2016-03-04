// Diffuse all of the Bombs!
//Bomb.diffuse( /* your guess goes here */ );
Bomb.diffuse(42);


for(var i = 0; i < 5; i++) {
  Bomb.diffuse();
}

Bomb.diffuse(BombKey);

function diffuseTheBomb() { return true; }
Bomb.diffuse();

Bomb.diffuse(3.14159);

var date = new Date()
date.setFullYear(date.getFullYear() - 4);
Bomb.diffuse(date);

var code = { key: 43 };
Object.freeze(code);
Bomb.diffuse(code);

var obj = {
  value: 7,
  valueOf: function() {
    return this.value += 2;
  }
};
Bomb.diffuse(obj);

var flag = true;
Math.random = function (){
  if(flag) {
    flag = false;
    return 0.5;
  }
  return 1;
};
Bomb.diffuse(42);

Array.prototype.valueOf = function() {
  var ans = 0;
  for(var i = 0; i < this.length; i++)
    ans += this[i];
  return ans;
};

Bomb.diffuse('eWVz'); //base64 yes
console.log('==============');

console.log(Bomb.diffuse.toString());
console.log(Bomb.key);
console.log(Bomb.hint);
