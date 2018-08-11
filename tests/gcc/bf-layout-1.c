
int TestNano ()
{
  struct { long f8:8; long f24:24; } a;
  struct { long f32:32; } b;
  if (sizeof (a) != sizeof (b))
    return 1;
  return 0;
}
