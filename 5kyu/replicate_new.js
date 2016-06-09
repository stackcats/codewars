function nouveau(Constructor, ...arg) {
  // Don't forget, unnamed arguments after Constructor may be passed in!
  return Reflect.construct(Constructor, arg);
}
