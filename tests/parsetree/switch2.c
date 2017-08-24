int do_switch(int a, int b)
{
	int d = a;
	switch (a+b) {
		case 1: {
			d++;
			break;
		}
		case 2 ... 3: {
			d += 2;
			break;
		}
	}
	return d;
}