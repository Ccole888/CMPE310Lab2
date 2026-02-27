#include <stdio.h>
#include <string.h>
extern unsigned char ram[];
extern int hamDist(int size1, int size2);

int main() {

    char m1[256];
    char m2[256];
    printf("enter the first message: ");
    fgets(m1, sizeof(m1), stdin);
    printf("enter the second message: ");
    fgets(m2, sizeof(m2), stdin);
    for(int i = 0; i < sizeof(m1); i++) {
        ram[i] = m1[i];
    }
    for(int i = 0; i < sizeof(m2); i++) {
        ram[256 + i] = m2[i];
    }
    int result = hamDist(sizeof(m1), sizeof(m2));

    printf("Hamming distance: %d\n", result);
    return 0;
}
