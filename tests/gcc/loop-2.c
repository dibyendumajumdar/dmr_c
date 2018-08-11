void f (int a[], int b)
{
  unsigned int i;
  for (i = 0; i < b; i++)
    a[i] = i - 2;
}

int TestNano ()
{
  int a[2];

  a[0] = a[1] = 0;
  f (a, 2);
  if (a[0] != -2 || a[1] != -1)
    return 1;
  return 0;
}
