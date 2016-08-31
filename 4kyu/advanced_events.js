function Event() {
  const handler = [];
  return new class {
    subscribe(...arr) {
      for (const f of arr) {
	if (typeof f === 'function') {
	  handler.push(f);
	}
      }
    }

    unsubscribe(...arr) {
      for (const f of arr) {
	if (typeof f === 'function') {
	  const ndx = handler.lastIndexOf(f);
          if (ndx !== -1) handler.splice(ndx, 1);
	}
      }
    }

    emit(...arr) {
      const tmp = handler.slice(0);
      for (const f of tmp) {
	f.apply(this, arr);
      }
    }
  };
}
