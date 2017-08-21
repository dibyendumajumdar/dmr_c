int a;

void foo(void)
{

	if (a == 1)
		goto Ok;
	if (a == 2)
		goto Error;

Error:
	a = 0;	
Ok:
	a = 4;
}