int do_for(void)
{
	int acc = 0;
    for (int i = 0; i < 100; i++) {
        if (i < 5) continue;
        if (i == 9) break;
        acc += i;
    }
    return acc;
}