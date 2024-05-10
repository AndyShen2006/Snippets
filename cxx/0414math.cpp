#include <bits/stdc++.h>

using namespace std;

double as[] = { 9.8, 9.7, 9.55, 9.54, 9.48, 9.42, 9.4, 9.35, 9.3, 9.25 };
double bs[] = { 9.78, 9.56, 9.51, 9.36, 9.32, 9.23 };
double cs[] = { 9.85, 9.65, 9.2, 9.16 };

int main()
{
    double poss, sum = 0;
    for (auto a : as) {
        int cnt1 = 0, cnt2 = 0;
        for (auto b : bs) {
            if (a > b) {
                cnt1++;
            }
        }
        for (auto c : cs) {
            if (a > c) {
                cnt2++;
            }
        }
        poss = (cnt1 / 6.0) * (cnt2 / 4.0);
        sum += poss / 10.0;
    }
    cout << sum << endl;
    sum = 0;
    for (auto b : bs) {
        int cnt1 = 0, cnt2 = 0;
        for (auto a : as) {
            if (b > a) {
                cnt1++;
            }
        }
        for (auto c : cs) {
            if (b > c) {
                cnt2++;
            }
        }
        poss = (cnt1 / 10.0) * (cnt2 / 4.0);
        sum += poss / 6.0;
    }
    cout << sum << endl;
    sum = 0;
    for (auto c : cs) {
        int cnt1 = 0, cnt2 = 0;
        for (auto b : bs) {
            if (c > b) {
                cnt1++;
            }
        }
        for (auto a : as) {
            if (c > a) {
                cnt2++;
            }
        }
        poss = (cnt1 / 6.0) * (cnt2 / 10.0);
        sum += poss / 4.0;
    }
    cout << sum << endl;
    return 0;
}