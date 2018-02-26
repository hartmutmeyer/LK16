package tmp;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.util.Random;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JTextField;

public class KomponentenAlsArrays extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JTextField[] tf = new JTextField[5];
	private Random zufall = new Random();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					KomponentenAlsArrays frame = new KomponentenAlsArrays();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public KomponentenAlsArrays() {
		createGUI();
		int i = zufall.nextInt(5);
		tf[i].setText("Hallo");
	}

	private void createGUI() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		tf[0] = new JTextField();
		tf[0].setBounds(10, 11, 86, 20);
		contentPane.add(tf[0]);
		tf[0].setColumns(10);
		
		tf[1] = new JTextField();
		tf[1].setBounds(10, 42, 86, 20);
		contentPane.add(tf[1]);
		tf[1].setColumns(10);
		
		tf[2] = new JTextField();
		tf[2].setBounds(10, 73, 86, 20);
		contentPane.add(tf[2]);
		tf[2].setColumns(10);
		
		tf[3] = new JTextField();
		tf[3].setBounds(10, 104, 86, 20);
		contentPane.add(tf[3]);
		tf[3].setColumns(10);
		
		tf[4] = new JTextField();
		tf[4].setBounds(10, 133, 86, 20);
		contentPane.add(tf[4]);
		tf[4].setColumns(10);		
	}
}
