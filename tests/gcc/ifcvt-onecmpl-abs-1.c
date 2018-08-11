int foo(int n)
{
  if (n < 0)
    n = ~n;

  return n;
}

int TestNano (void)
{
  if (foo (-1) != 0)
    return 1;

  return 0;
}
