import java.awt.*;
import javax.swing.*;

class Main {
    public static void main(String[] args) {
        
        JFrame frame = new JFrame("Adder");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300,300);

        JPanel panel = new JPanel();

        BorderLayout layout = new BorderLayout();
        panel.setLayout(layout);

        JLabel label = new JLabel("0");
        JButton button = new JButton("+ 1");
        button.addActionListener(e -> {
            label.setText(
                "" + 
                (Integer.parseInt(label.getText()) + 1));
        });

        panel.add(label, BorderLayout.CENTER);
        panel.add(button, BorderLayout.PAGE_END);
        frame.add(panel);
        frame.setVisible(true);
    }
}