extern int printf(const char *fmt, ...);

int main(void) {
    int Count;

    for (Count = 0; Count < 4; Count++)
    {
        printf("%d\n", Count);
        switch (Count)
        {
        case 1:
            printf("%d\n", 1);
            break;
        case 2:
            printf("%d\n", 2);
            break;
        default:
            printf("%d\n", 0);
            break;
        }
    }

    return 0;
}
