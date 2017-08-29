class Thing {
  constructor(name) {
    this.name = name;
    this.is_a = {};
  }

  
}


function test() {
  const jane = new Thing('Jane');
  jane.is_a.person;
}


test();
