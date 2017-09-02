int testswitch(int i)
{
	switch (i) {
	case 0: i = i + 1; break;
	case 1: i = i - 4; break;
	case 2: i = i + 5; break;
	default: i++; break;
	}
	return i;
}
