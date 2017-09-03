int testswitch(int i)
{
	switch (i) {
	case 0: i = i + 1; break;
	case 1: i = i - 4; break;
	case 4:
	case 2: i = i + 5; break;
	default: i++; break;
	}
	return i;
}

int TestNano(void)
{
	if (testswitch(0) == 1 &&
		testswitch(1) == -3 &&
		testswitch(2) == 7 &&
		testswitch(4) == 9 &&
		testswitch(7) == 8)
		return 0;
	return 1;
}
