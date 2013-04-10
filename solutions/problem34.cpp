#include <iostream>
#include <string>
#include <sstream>

bool isCurious(int n);
int operation(int n);
int factorial(int n);

int main(int argc, const char * arg[]) {

    int sum = 0;
    for (int i = 3; i < 10000000; i++) {
     	if (isCurious(i))
     	    sum += i;
    }
    std::cout << sum;
    
    return 0;
}

bool isCurious(int n) {
    return n == operation(n); 
}

int operation(int n) {
    std::string digits = std::to_string(n);
    
    int sum = 0;
    for (int i = 0; i < digits.length(); i++) {
	 int number = digits[i] - '0';
	 sum += factorial(number);
    }

    return sum;
}

int factorial(int n) {
    if (n == 0) {
	return 1;
    }
    
    return n*factorial(n-1);
}

