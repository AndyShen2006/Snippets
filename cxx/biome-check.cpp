#include <bits/stdc++.h>

using namespace std;

vector<string> biomes;
set<string> check;

int main()
{
    freopen("biome.csv", "r", stdin);
    int n;
    cin >> n;
    for (int i = 1; i <= n; i++) {
        string str;
        cin >> str;
        for (auto& it : str) {
            if (isupper(it)) {
                it = char(tolower(it));
            }
        }
        biomes.push_back(str);
    }
    cin.clear();
    freopen("biome.in", "r", stdin);
    cin >> n;
    for (int i = 1; i <= n; i++) {
        string str;
        cin >> str;
        check.insert(str);
    }
    for (const auto& it : biomes) {
        if (check.find(it) == check.end()) {
            cout << it << endl;
        }
    }
}