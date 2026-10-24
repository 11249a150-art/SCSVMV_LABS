//Aim:
To write a Java applet program to demonstrate the CardLayout layout manager, which displays one button at a time and switches to the next button when clicked.

//Algorithm:
Start the program.
Import the java.awt, java.applet, and java.awt.event packages.
Create an applet class named carddemo that implements the ActionListener interface.
Declare three buttons, a panel, and a CardLayout object.
Create a panel and add it to the applet.
Create a CardLayout object and set it as the layout manager for the panel.
Create three buttons: First Button, Second Button, and Third Button.
Register the action listener for each button.
Add the three buttons to the panel with their respective card names.
Override the actionPerformed() method to display the next card using buttonCardLayout.next(buttonPanel).
Execute the applet and click the buttons to switch between the cards.
Stop the program.

//program:
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class carddemo extends JFrame implements ActionListener {

    JButton b1, b2, b3;
    JPanel buttonPanel;
    CardLayout buttonCardLayout;

    public carddemo() {
        buttonPanel = new JPanel();

        buttonCardLayout = new CardLayout();
        buttonPanel.setLayout(buttonCardLayout);

        b1 = new JButton("First Button");
        b1.addActionListener(this);
        buttonPanel.add(b1, "first");

        b2 = new JButton("Second Button");
        b2.addActionListener(this);
        buttonPanel.add(b2, "second");

        b3 = new JButton("Third Button");
        b3.addActionListener(this);
        buttonPanel.add(b3, "third");

        add(buttonPanel);

        setTitle("CardLayout Demo");
        setSize(250, 150);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        buttonCardLayout.next(buttonPanel);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            carddemo demo = new carddemo();
            demo.setVisible(true);
        });
    }
}

//Result:
Thus, the Java applet program demonstrating the CardLayout layout manager was executed successfully. It displays one button at a time and switches to the next button whenever
the currently displayed button is clicked.