#include "matrix.hpp"
#include <bits/stdc++.h>

using namespace std;

int arr[5][4] = { { 1, 2, 3, 4 }, { 1, 2, 3, 4 }, { 1, 2, 3, 4 }, { 1, 2, 3, 4 }, { 1, 2, 3, 4 } };

int main()
{
    Matrix<int> m1({
        { 1, 2, 3, 4 },
        { 5, 6, 7, 8 },
        // { 9, 10, 11, 12 },
        // { 13, 14, 15, 16 },
    });
    Matrix<int> m2({
        { 1, 2 },
        { 3, 4 },
        { 5, 6 },
        { 7, 8 },
    });
    // m1.show();
    // m2.show();
    // m1.part(1, 1, 1, 2).show();
    // (m1 + m2).show();
    (m1 * m2).show();
    Matrix<int>::NaiveMultiply(m1, m2).show();
    return 0;
}