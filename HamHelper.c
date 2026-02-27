#include <stdio.h>
#include <string.h>
extern unsigned char ram[];
extern int hamDist(char *m1, char *m2, int size1, int size2);

int main() {

    char m1[256];
    char m2[256];
    printf("enter the first message: ");
    fgets(m1, sizeof(m1), stdin);
    printf("enter the second message: ");
    fgets(m2, sizeof(m2), stdin);
    int result = hamDist(m1, m2, strlen(m1)-1, strlen(m2)-1);

    printf("Hamming distance: %d\n", result);
    return 0;
}
