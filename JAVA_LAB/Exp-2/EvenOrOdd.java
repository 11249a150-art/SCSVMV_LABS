//Aim:
To write a Java program to check whether a given number is even or odd using a switch statement.

//Algorithm:
Start the program.
Import the Scanner class to read input from the user.
Declare an integer variable n.
Read a number from the user.
Find the remainder using n % 2.
Use a switch statement to check the remainder:
If the remainder is 0, display “This number is even”.
If the remainder is 1 or -1, display “This number is odd”.
Close the scanner.
Stop the program.

//program:
import java.util.*;
class EvenorOdd{
    public static void main(String args[]) {
        int n;
        Scanner s = new Scanner(System.in);
        System.out.print("Enter a number: ");
        n = s.nextInt();
        switch (n % 2) {
            case 0:
                System.out.println("This number is even");
                break;
            case 1:
            case -1:
                System.out.println("This number is odd");
                break;
        }
        s.close();
    }
}

//Output
Output 1: Even Number
Enter a number: 8
This number is even
Output 2: Odd Number
Enter a number: 7
This number is odd

//Result:
Thus, the Java program to check whether a given number is even or odd using a switch statement was executed successfully.