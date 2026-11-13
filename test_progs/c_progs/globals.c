#include<stdio.h>
#include<stdlib.h>

void swap(int *a, int *b) {
    int t = *a;
    *a = *b;
    *b = t;
}

void identity(int *a, int *b) {
    *a = *a;
    *b = *b;
}

struct newtype {
    int id1;
    void (*f_ptr) (int *, int *);
    int id2;
};

struct newtype first_obj = {
    .id1 = 0,
    .f_ptr = swap,
    .id2 = 1,
};

struct newtype second_obj = {
    .id1 = 2,
    .f_ptr = identity,
    .id2 = 3,
};

int main() {
    first_obj.f_ptr = identity;
    second_obj.f_ptr = swap;

    return 0;
}