function parse(s) {
  const c = s[s.length - 1];
  const sign = (c === 'W' || c === 'S') ? -1 : 1;
  const arr = s.split(/[^\d]/).filter(ch => ch !== '').map(Number);
  // 需要角度转弧度 Math.PI / 180 * 角度 ＝ 弧度
  return Math.PI * sign * (arr[0] + arr[1] / 60 + arr[2] / 3600) / 180;
}
function parse_coord(coord) {
  const [latitude, longitude] = coord.split(',');
  return [parse(latitude), parse(longitude)];
}

const R = 6371;

function distance(coord1, coord2) {
  const [b1, a1] = parse_coord(coord1);
  const [b2, a2] = parse_coord(coord2);
  return ~~(R * Math.acos(Math.cos(b1) * Math.cos(b2) * Math.cos(a1 - a2)
                          + Math.sin(b1) * Math.sin(b2)) / 10) * 10;
}
