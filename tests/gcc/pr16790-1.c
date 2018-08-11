/* PR middle-end/16790.  */

static int test1(unsigned int u1)
{
  unsigned int y_final_1;
  signed short y_middle;
  unsigned int y_final_2;

  y_final_1 = (unsigned int)( (signed short)(u1 * 2) * 3 );
  y_middle  =                 (signed short)(u1 * 2);
  y_final_2 = (unsigned int)( y_middle * 3 );

  if (y_final_1 != y_final_2)
    return 1;
  return 0;
}


static int test2(unsigned int u1)
{
  unsigned int y_final_1;
  signed short y_middle;
  unsigned int y_final_2;

  y_final_1 = (unsigned int)( (signed short)(u1 << 1) * 3 );
  y_middle  =                 (signed short)(u1 << 1);
  y_final_2 = (unsigned int)( y_middle * 3 );

  if (y_final_1 != y_final_2)
    return 1;
  return 0;
}


int TestNano ()
{
  if (test1(0x4000U))
    return 1;
  if (test2(0x4000U))
    return 2;
  return 0;
}

