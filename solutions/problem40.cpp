#include <iostream>
#include <string>
using namespace std;

bool isPower(int n);

int main(int argc, const char * arg[]) {

    int pos = 0;
    int value = 1;
    for (int i = 1; i < 1000000; i++) {
	string num = to_string(i);
	for (int k = 0; k < num.length(); k++) {
	    pos++;
	    if (isPower(pos)) {
		value *= num[k] - '0';
	    }
	}

	if (pos >= 1000000) {
	    break;
	}
    }

    cout << value;

    return 0;
}

bool isPower(int n) {
    if (n==1 || n==10 || n==100 || n==1000
	|| n==10000 || n==100000 || n==1000000) {
	return true;
    }
    return false;
}
