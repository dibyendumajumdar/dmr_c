unsigned
sat_add (unsigned i)
{
  unsigned ret = i + 1;
  if (ret < i)
    ret = i;
  return ret;
}

unsigned
sat_add2 (unsigned i)
{
  unsigned ret = i + 1;
  if (ret > i)
    return ret;
  return i;
}

unsigned
sat_add3 (unsigned i)
{
  unsigned ret = i - 1;
  if (ret > i)
    ret = i;
  return ret;
}

unsigned
sat_add4 (unsigned i)
{
  unsigned ret = i - 1;
  if (ret < i)
    return ret;
  return i;
}
int TestNano ()
{
  if (sat_add (~0U) != ~0U)
    return 1;
  if (sat_add2 (~0U) != ~0U)
    return 2;
  if (sat_add3 (0U) != 0U)
    return 3;
  if (sat_add4 (0U) != 0U)
    return 4;
  return 0;
}
