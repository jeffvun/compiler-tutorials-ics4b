/**
 * A Cpp program to list the first 10 fibonacci numbers 
*/
#include <iostream>
using namespace std;

int main() {
    int n = 10, t1 = 0, t2 = 1, nextTerm = 0;
    cout << "Fibonacci Series: ";

    for (int i = 1; i <= n; ++i) {
        // Prints the first two terms.
        if(i == 1) {
            cout << t1 << ", ";
            continue;
        }
        if(i == 2) {
            cout << t2 << ", ";
            continue;
        }
        //Prints the other terms (8)
        nextTerm = t1 + t2;
        t1 = t2;
        t2 = nextTerm;
        
        cout << nextTerm << ", ";
    }
    return 0;
}
