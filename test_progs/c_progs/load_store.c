int main() {

    int a = 0;
    int *b = &a;
    int **c = &b;
    int *d = *c;
    return 0;
}