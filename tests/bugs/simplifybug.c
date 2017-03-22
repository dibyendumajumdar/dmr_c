static int regc(void)
{
	char r00, r01, r02;
	int s, n1, n2, j, d[2];
	r00 = 0;
	r01 = 1;
	r02 = 2;
	d[0] = &r01 - &r00;
	d[1] = &r02 - &r01;

	n1 = d[0];
	s = 1;

	for (j = 0; j < 2; j++)
		switch (s) {
		case 1:
			n2 = d[j];
			break;
		case 2:
			if (d[j] == n2) {
				break;
			}
			s = 4;
			break;
		};
	return s;
}
