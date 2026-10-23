//Aim:
To write a Java program to print the multiplication table of a given number using a for loop.

//Algorithm:
Start the program.
Import the Scanner class to read input from the user.
Read an integer no from the user.
Display the multiplication table heading.
Use a for loop from 1 to 10.
Multiply the given number by each value from 1 to 10.
Display the multiplication table in the format no * i = result.
Close the scanner.
Stop the program.

//program:
import java.util.*;
public class MulTable {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the number: ");
        int no = sc.nextInt();
        System.out.println("Multiplication Table of " + no);
        for (int i = 0; i < 10; i++) {
            System.out.println(no + " * " + (i + 1) + " = " + (no * (i + 1)));
        }
        sc.close();
    }
}

//Output
Enter the number: 5
Multiplication Table of 5
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
5 * 4 = 20
5 * 5 = 25
5 * 6 = 30
5 * 7 = 35
5 * 8 = 40
5 * 9 = 45
5 * 10 = 50

//Result:
Thus, the Java program to print the multiplication table of a given number was executed successfully.