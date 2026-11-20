#include<stdlib.h>

int* escape() {
    int x;
    int *y = malloc(sizeof(int));
    *y = 35;
    x = *y;
    return &x;
}

int main() {
    escape();
    return 0;
}