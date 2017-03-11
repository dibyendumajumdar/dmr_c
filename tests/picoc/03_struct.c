extern int printf(const char *fmt, ...);

struct fred
{
    int boris;
    int natasha;
};

int main(void) {

	struct fred bloggs;

	bloggs.boris = 12;
	bloggs.natasha = 34;

	printf("%d\n", bloggs.boris);
	printf("%d\n", bloggs.natasha);

	//struct fred jones[2];
	//jones[0].boris = 12;
	//jones[0].natasha = 34;

	return 0;
}
