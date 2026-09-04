#include <iostream>
#include <limits>

using namespace std;

int main() {
    int choice;
    double num1, num2, result;

    do {
        cout << "\n===== BASIC CALCULATOR =====\n";
        cout << "1. Addition (+)\n";
        cout << "2. Subtraction (-)\n";
        cout << "3. Multiplication (*)\n";
        cout << "4. Division (/)\n";
        cout << "5. Modulus (%)\n";
        cout << "6. Exit\n";
        cout << "Enter your choice: ";

        if (!(cin >> choice)) {
            cout << "Invalid input! Please enter a number.\n";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            continue;
        }

        if (choice == 6) {
            cout << "Exiting Calculator...\n";
            break;
        }

        if (choice < 1 || choice > 6) {
            cout << "Invalid choice! Try again.\n";
            continue;
        }

        cout << "Enter first number: ";
        cin >> num1;

        cout << "Enter second number: ";
        cin >> num2;

        switch (choice) {
            case 1:
                result = num1 + num2;
                cout << "Result = " << result << endl;
                break;

            case 2:
                result = num1 - num2;
                cout << "Result = " << result << endl;
                break;

            case 3:
                result = num1 * num2;
                cout << "Result = " << result << endl;
                break;

            case 4:
                if (num2 == 0) {
                    cout << "Error: Division by zero is not allowed!\n";
                } else {
                    result = num1 / num2;
                    cout << "Result = " << result << endl;
                }
                break;

            case 5:
                if ((int)num2 == 0) {
                    cout << "Error: Modulus by zero is not allowed!\n";
                } else {
                    cout << "Result = "
                         << (int)num1 % (int)num2 << endl;
                }
                break;
        }

    } while (true);

    return 0;
}
