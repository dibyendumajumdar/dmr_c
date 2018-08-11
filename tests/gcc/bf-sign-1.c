int TestNano ()
{
#if 0
  struct  {
    signed int s:3;
    unsigned int u:3;
    int i:3;
  } x = {-1, -1, -1};
#else
  struct  {
    signed int s:3;
    unsigned int u:3;
    int i:3;
  } x;
  x.s = -1;
  x.u = -1;
  x.i = -1;
#endif

  if (x.u != 7)
    return 1;
  if (x.s != -1)
    return x.s;

  if (x.i != -1 && x.i != 7)
    return 3;

  return 0;
}
