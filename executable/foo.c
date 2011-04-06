#include <libgen.h>
#include <stdio.h>

extern int lib1(void);
extern int lib2(void);
extern char *bar(void);

int
main(int argc, char *argv[])
{
    printf("%s: %d\n", basename(argv[0]), lib1());
    printf("%s: %d\n", basename(argv[0]), lib2());
    printf("%s: %s\n", basename(argv[0]), bar());
    return 0;
}
