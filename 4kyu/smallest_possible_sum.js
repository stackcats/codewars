function solution(numbers) {
  numbers = numbers.sort((a, b) => {
    return b - a;
  });
  while (numbers[0] !== numbers[numbers.length-1]) {
    if (numbers[numbers.length - 1] <= 1) return numbers.length;
    for (let i = 0; i < numbers.length; i++) {
      const last = numbers[numbers.length - 1];
      if (numbers[i] % last === 0) {
        numbers[i] = last;
      } else {
        numbers[i] %= last;
      }
    }
    numbers = numbers.sort((a, b) => {
      return b - a;
    });
  }
  
  return numbers.reduce((a, b) => a + b, 0);
}
