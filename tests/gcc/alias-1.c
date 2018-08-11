
void typepun (float *ptr2)
{
  *ptr2=0;
}

int TestNano(void)
{
	int val;

	int *ptr = &val;
	float *ptr2 = (float*)&val;

  	*ptr=1;
  	typepun (ptr2);
  	if (*ptr)
    	return 1;
    return 0;
}

