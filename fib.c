int fib(int n) {
  int a = 0;
  int b = 1;
  while (n > 0) {
    int t = b;
    b = a + b;
    a = t;
    n--;
  }
  return b;
}
