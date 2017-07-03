int doif(int a, int b)
{
	if (a < b)
		return a+5;
	else if (b < a)	
		return a-5;
	else if (a * b >= 10)
		return 15;
	else {
		int c = a/b;
		int d = a%b;
		if (c <= 1)
			return d;
		else if (d != 0)
			return d;
		else
			return c+1;
	}
}
