//Aim:
To write a Java applet program to demonstrate the use of BorderLayout for arranging buttons and a text area in the North, South, East, West, and Center regions.

//Algorithm:
Start the program.
Import the java.awt and java.applet packages.
Create an applet class named insertdemo.
Override the init() method.
Set the background color to cyan.
Set the layout manager to BorderLayout.
Add buttons to the North, South, East, and West regions.
Create a TextArea and add it to the Center region with the specified message.
Override the getInsets() method to set a 10-pixel margin on all sides.
Execute the applet to display the components.
Stop the program.

//program:
import java.awt.*;
import javax.swing.*;

public class insertdemo extends JFrame {

    public insertdemo() {
        setBackground(Color.cyan);
        setLayout(new BorderLayout());

        add(new JButton("This is across the top"), BorderLayout.NORTH);
        add(new JButton("The footer message might go here"), BorderLayout.SOUTH);
        add(new JButton("RIGHT"), BorderLayout.EAST);
        add(new JButton("LEFT"), BorderLayout.WEST);

        String msg = "The reasonable man adapts\n\n";
        add(new JTextArea(msg), BorderLayout.CENTER);

        getRootPane().setBorder(
            BorderFactory.createEmptyBorder(10, 10, 10, 10)
        );

        setTitle("Insert Demo");
        setSize(400, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            insertdemo demo = new insertdemo();
            demo.setVisible(true);
        });
    }
}

//Result:
Thus, the Java applet program demonstrating the BorderLayout layout manager was written successfully. The buttons are displayed in the North, South, East, and West regions, and 
the text area is displayed in the Center region with a cyan background.