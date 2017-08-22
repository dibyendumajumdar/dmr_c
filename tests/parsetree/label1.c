int a;

void foo(void)
{

	if (a == 1)
		goto Ok;
	if (a == 2) {
		a = 99;
		goto Error;
	}
	else
		goto Ok;

Error:
	a = 0;	
Ok:
	a = 4;
}