var wireCode; // Find the wire.
for(var f in global) {
  if(/boom/.test(f)) {
    Bomb.CutTheWire(global[f]);
  }
}
