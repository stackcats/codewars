function DocumentParser(reader) {
  this.reader = reader;
  this.reset();
}

DocumentParser.prototype.reset = function reset() {
  this.wordCount = 0;
  this.charCount = 0;
  this.lineCount = 0;
};

DocumentParser.prototype.parse = function parse() {
  let chunk = this.reader.getChunk();
  let isInWord = false;
  while (chunk !== '') {
    for (let i = 0; i < chunk.length; i++) {
      const c = chunk[i];
      if (c === ' ') {
        if (isInWord) {
          this.wordCount++;
          isInWord = false;
        }
        this.charCount++;
      } else if (c === '\n') {
        if (isInWord) {
          this.wordCount++;
          isInWord = false;
        }
        this.lineCount++;
      } else {
        isInWord = true;
        this.charCount++;
      }
    }
    chunk = this.reader.getChunk();
  }

  if (this.charCount === 0) {
    this.lineCount = 0;
    this.wordCount = 0;
    return;
  }

  this.lineCount++;

  if (isInWord) {
    this.wordCount++;
  }
};
