struct S { float f; };
int foo (int *r, struct S *p)
{
  int *q = (int *)&p->f;
  int i = *q;
  *r = 0;
  return i + *q;
}
int TestNano ()
{
  int i = 1;
  if (foo (&i, (struct S *)&i) != 1)
    return 1;
  return 0;
}
