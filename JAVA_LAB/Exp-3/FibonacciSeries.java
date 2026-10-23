//Aim:
To write a Java program to generate the Fibonacci series up to n terms using a method.

//Algorithm:
Start the program.
Import the Scanner class to read input from the user.
Read the number of terms n.
Call the fibonacci(n) method.
If n is less than or equal to 0, display “Please enter a positive number.”
If n is equal to 1, display 0.
Otherwise, initialize a = 0 and b = 1.
Use a for loop to repeat n times:
Display the value of a.
Calculate the next number using nextNumber = a + b.
Update a = b and b = nextNumber.
Close the scanner.
Stop the program.


//program:
import java.util.Scanner;
public class FibonacciSeries {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        System.out.print("Enter the value of n: ");
        int n = s.nextInt();
        fibonacci(n);
        s.close();
    }
    public static void fibonacci(int n) {
        if (n <= 0) {
            System.out.println("Please enter a positive number.");
        }
        else if (n == 1) {
            System.out.println("0");
        }
        else {
            int a = 0;
            int b = 1;
            System.out.print("Fibonacci Series: ");
            for (int i = 0; i < n; i++) {
                System.out.print(a + " ");
                int nextNumber = a + b;
                a = b;
                b = nextNumber;
            }
        }
    }
}

//Output
Output 1
Enter the value of n: 7
Fibonacci Series: 0 1 1 2 3 5 8

Sample Output 2
Enter the value of n: 1
0

Sample Output 3
Enter the value of n: 0
Please enter a positive number.
    
//Result:
Thus, the Java program to generate the Fibonacci series up to n terms was executed successfully.