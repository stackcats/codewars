var GeneticAlgorithm = function () {};

GeneticAlgorithm.prototype.generate = function(length) {
  // TODO: Implement the generate method
  var chromo = '';
  for(var i = 0; i < length; i++) {
    if(Math.random() < 0.5)
      chromo += '0';
    else
      chromo += '1';
  }
  return chromo;
};

GeneticAlgorithm.prototype.select = function(population, fitnesses) {
  // TODO: Implement the select method
  var chromos = [];
  
  var totalFitness = fitnesses.reduce(function(a, b) {
    return a + b;
  }, 0);
  
  var idx = -1;
  while(chromos.length < 2) {
    var rand = Math.random() * totalFitness;
    //console.log(rand);
    for(var i = population.length - 1; i >= 0; i--) {
      if(rand < fitnesses[i] && idx != i) {
        idx = i;
        chromos.push(population[i]);
        rand -= fitnesses[i];
        if(chromos.length == 2)
          break;
      } else {
        rand -= fitnesses[i];
      }
    }
  }

  return chromos;
};

GeneticAlgorithm.prototype.mutate = function(chromosome, p) {
  // TODO: Implement the mutate method
  var chrome = '';
  for(var i = 0; i < chromosome.length; i++) {
    if(Math.random() < p) {
      if(chromosome[i] == '0')
        chrome += '1';
      else
        chrome += '0';
    } else {
      chrome += chromosome[i];
    }
  }
  return chrome;
};

GeneticAlgorithm.prototype.crossover = function(chromosome1, chromosome2) {
  // TODO: Implement the crossover method
  var len = chromosome1.length;
  var ndx = Math.floor(Math.random() * (len - 1)) + 1;
  var ch1 = chromosome1.substring(0, ndx) + chromosome2.substring(ndx);
  var ch2 = chromosome2.substring(0, ndx) + chromosome1.substring(ndx);
  
  return [ch1, ch2];
};

GeneticAlgorithm.prototype.run = function(fitness, length, p_c, p_m, iterations) {
  // TODO: Implement the run method
  
  var N = 100;
  var pool = new Array(N);
  var fitArr = new Array(N);
  for(var i = 0; i < N; i++) {
    var c = this.generate(length);
    pool[i] = c;
    fitArr[i] = fitness(c);
  }
  var iter = iterations || 100;
  while(iter-- > 0) {
    
    var newPool = [];
    var newfitArr = [];
    for(i = 0; i < N/2; i++) {
      var chromes = this.select(pool, fitArr);
      if(Math.random() < p_c) {
        chromes = this.crossover(chromes[0], chromes[1]);
      }
      
      var ch1 = this.mutate(chromes[0], p_m);
      var ch2 = this.mutate(chromes[1], p_m);
      newPool.push(ch1);
      newPool.push(ch2);
      newfitArr.push(fitness(ch1));
      newfitArr.push(fitness(ch2));
    }
    pool = newPool;
    fitArr = newfitArr;
  }
  var m = -1, idx = 0;
  for(i = 0; i < N; i++) {
    if(m < fitArr[i]) {
      m = fitArr[i];
      idx = i;
    }
  }
  return pool[idx];
};
