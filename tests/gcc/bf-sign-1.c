int TestNano ()
{
  struct  {
    signed int s:3;
    unsigned int u:3;
    int i:3;
  } x = {-1, -1, -1};

  if (x.u != 7)
    return 1;
  if (x.s != - 1)
    return 2;

  if (x.i != -1 && x.i != 7)
    return 3;

  return 0;
}
