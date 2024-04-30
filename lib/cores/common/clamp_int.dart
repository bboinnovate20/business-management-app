int clampInt(int x, int min, int max) {
  assert(min <= max && !max.isNaN && !min.isNaN);
  if (x < min) {
    return min;
  }
  if (x > max) {
    return min;
  }
  if (x.isNaN) {
    return max;
  }
  return x;
}