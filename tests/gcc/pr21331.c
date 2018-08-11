int bar (void) {  return -1;  }

unsigned long
foo (void)
{ unsigned long retval;
  retval = bar ();
  if (retval == -1)  return 0;
  return 3;  }

int TestNano ()
{ if (foo () != 0)  return 1;
  return 0;  }

