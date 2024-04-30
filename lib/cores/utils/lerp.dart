
double lerp(double value, double start1, double stop1, double start2, double stop2) {
    if(value > stop1) return stop2;
    double result = start2 + (stop2 - start2) * ((value - start1) / (stop1 - start1));
    return result;
}
  