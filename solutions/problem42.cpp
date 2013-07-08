#include <iostream>
#include <fstream>
#include <string>
#include <regex>
using namespace std;

int main(int argc, char * args[]) {

    int count = 0;

    ifstream file;
    file.open("/Users/lucas/Documents/project_euler/solutions/data/words.txt");
    
    string s;
    getline(file, s);

    file.close();

    regex exp ("\"([^\"]*)\"");
    smatch words;
    regex_match(s, words, exp);

    cout << words.size();
    cout << words[0];
    
    return 0;
}
