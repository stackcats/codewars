function isValidCoordinates(coordinates){
  var regex = /^[-]?(\d|([0-8]\d)|(90))(\.\d*)?, [-]?(\d|(\d\d)|(1[0-7]\d)|(180))(\.\d*)?$/;
  return regex.test(coordinates);
}
