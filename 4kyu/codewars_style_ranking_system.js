// TODO: create the User class/object
// it must support rank, progress and the incProgress(rank) method
function User() {
  this.rank = -8;
  this.progress = 0;
}

User.prototype.incProgress = function(rank) {
  if(rank == 0 || rank < -8 || rank > 8)
    throw new Error('rank overflow');
  if(this.rank == 8) {
    return;
  }
  if(rank == this.rank)
    this.progress += 3;
  else if(rank > this.rank){
    var diff = rank - this.rank;
    if(rank > 0 && this.rank < 0)
      diff--;
    this.progress += 10 * diff * diff;
  } else {
    this.progress += 1;
  }
  
  while(this.progress > 100) {
    this.rank++;
    if(this.rank == 0)
      this.rank++;
    this.progress -= 100;
  }
  if(this.rank == 8)
    this.progress = 0;
}
