#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Define structure for a Bank User
typedef struct
{
    char username[50];
    char password[50];
    int role; // 1 for Admin, 2 for Customer
} BankUser;

// Function to login
int login(BankUser users[], int size, char username[], char password[])
{
    for (int i = 0; i < size; i++)
    {
        if (strcmp(users[i].username, username) == 0 && strcmp(users[i].password, password) == 0)
        {
            return users[i].role;
        }
    }
    return 0; // 0 indicates login failure
}


int main()
{
    // Display welcome message
    printf("Welcome to the Bank Management System\n");

    // Initialize bank users
    BankUser users[2] = {
        {"adminUser", "adminPass", 1},
        {"customerUser", "customerPass", 2}};

    char username[50], password[50];
    printf("Enter Username: ");
    scanf("%s", username);
    printf("Enter Password: ");
    scanf("%s", password);

    // Attempt to log in
    int role = login(users, 2, username, password);

// Detect platform
#if defined(_WIN32) || defined(_WIN64)
    if (role == 1)
    {
        system(".\\bin\\admin.exe");
    }
    else if (role == 2)
    {
        system(".\\bin\\customer.exe");
    }
    else
    {
        printf("Invalid credentials! Please try again.\n");
    }
#elif defined(__linux__) || defined(__APPLE__)
    if (role == 1)
    {
        system("./bin/admin.out");
    }
    else if (role == 2)
    {
        system("./bin/customer.out");
    }
    else
    {
        printf("Invalid credentials! Please try again.\n");
    }
#else
    printf("Unsupported platform!\n");
#endif

    return 0;
}
