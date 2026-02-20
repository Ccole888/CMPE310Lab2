#include <stdio.h>
#include <string.h>
extern unsigned char ram[];
extern void hamDist();

int main() {


    hamDist();

    unsigned long long result = *(unsigned long long*)&ram[0x0];
    printf("Hamming distance: %llu\n", result);
    return 0;
}
