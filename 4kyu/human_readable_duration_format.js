function formatDuration(s) {
  // Complete this function
  if (s === 0) return 'now';
  const ans = [];
  const year = 60 * 60 * 24 * 365;
  let a = ~~(s / year);
  if (a !== 0) {
    if (a === 1) {
      ans.push('1 year');
    } else {
      ans.push(`${a} years`);
    }
    s %= year;
  }

  const day = 60 * 60 * 24;
  a = ~~(s / day);
  if (a !== 0) {
    if (a === 1) {
      ans.push('1 day');
    } else {
      ans.push(`${a} days`);
    }
    s %= day;
  }

  const hour = 60 * 60;
  a = ~~(s / hour);
  if (a !== 0) {
    if (a === 1) {
      ans.push('1 hour');
    } else {
      ans.push(`${a} hours`);
    }
    s %= hour;
  }

  const min = 60;
  a = ~~(s / min);
  if (a !== 0) {
    if (a === 1) {
      ans.push('1 minute');
    } else {
      ans.push(`${a} minutes`);
    }
    s %= min;
  }

  if (s !== 0) {
    if (s === 1) {
      ans.push('1 second');
    } else {
      ans.push(`${s} seconds`);
    }
  }

  const n = ans.length;
  if (n === 1) return ans.join('');
  if (n === 2) return ans.join(' and ');
  const last = ans.pop();
  return `${ans.join(', ')} and ${last}`;
}
