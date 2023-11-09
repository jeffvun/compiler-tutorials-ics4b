
int main(void) {
    int i;
    int j;
    int m;
    int N;
    
    i = 1;
    j = 1;
    m = 0-1; 

    N = 15; 

    while (i < N * 2 + 1) {
        j = m * j;
        if (j < 0) {
            output(i);
        } else {
        }
        i = i + 1;
    }
}