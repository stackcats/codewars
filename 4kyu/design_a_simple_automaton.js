function Automaton() {
  this.states = {
    q1: { 1: 'q2', 0: 'q1' },
    q2: { 0: 'q3', 1: 'q2' },
    q3: { 1: 'q2', 0: 'q2' }
  };
}

Automaton.prototype.readCommands = function readCommands(commands) {
  console.log(commands);
  let state = 'q1';
  for (const c of commands) {
    state = this.states[state][c];
  }
  return state === 'q2';
};

const myAutomaton = new Automaton();
