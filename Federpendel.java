package euler;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.Timer;
import javax.swing.border.EmptyBorder;

public class Federpendel extends JFrame implements ActionListener {
	// globale Variablen
	private static final int WIDTH = 900;
	private static final int HEIGHT = 300;
	private static final Color BACKGROUND = Color.WHITE;
	private static final Color FOREGROUND = Color.BLACK;
	private JLabel zeichenflaeche;
	
	final static double D = 5.0; // Federkonstante in N/m
	final static double k = 0.1; // Dämpfungskonstante in kg/s
	final static double omega_err = 1.0; // Erregungskreisfreuenz in 1/s
	final static double F_err = 0.2; // Erregungsamplitude in N
	final static double m = 0.5; // Masse in kg
	final static double tMax = 60.0; // Zeitinterval in s
	final static double dt = 0.01; // Zeitschritt in s
	final static double sStart = 0.1; // Anfangsbedingungen in m ...
	final static double vStart = 0.0; // .. und m/s
	double tNow = 0.0;
	double F, s, v, t;
	
	Timer timer = new Timer((int)(1000*dt), this);

	public Federpendel(final String title) {
		super(title);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JPanel contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		zeichenflaeche = new JLabel() {
			@Override
			protected void paintComponent(Graphics g) {
				super.paintComponent(g);
				myPaint(g);
			}
		};
		zeichenflaeche.setPreferredSize(new Dimension(WIDTH, HEIGHT));
		zeichenflaeche.setOpaque(true);
		zeichenflaeche.setBackground(BACKGROUND);
		zeichenflaeche.setForeground(FOREGROUND);
		zeichenflaeche.setFont(new Font("Arial", Font.PLAIN, 12));
		contentPane.add(zeichenflaeche);
		pack();
		setLocationRelativeTo(null);
		setResizable(true);
		setVisible(true);
		
		//new FederpendelThread();
		timer.start();
		
	}
	
	double xScale, yScale, xOffset, yOffset;

	void setRange(double xMin, double xMax, double yMin, double yMax) {
		xScale = zeichenflaeche.getSize().width / (xMax - xMin);
		yScale = -zeichenflaeche.getSize().height / (yMax - yMin);
		xOffset = -xMin * xScale;
		yOffset = zeichenflaeche.getSize().height - yMin * yScale;
	}

	int sx(double x) {
		return (int) (x * xScale + xOffset);
	}

	int sy(double y) {
		return (int) (y * yScale + yOffset);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		tNow += dt;
		repaint();
	}
	
	public void myPaint(Graphics g) {
		// wird aufgerufen, wenn das Fenster neu gezeichnet wird
		setRange(0.0, tMax, -0.15, 0.15);
		g.drawLine(sx(0.0), sy(0.0), sx(tMax), sy(0.0));
		g.setColor(Color.BLUE);
		
		s = sStart; 
		v = vStart;
		
		for (t = 0.0; t <= tNow; t += dt) { 
			// Momentaufnahme der Kraft

			// Euler Integration
			// erst v, dann s neu berechnen (genauere Ergebnisse bei großen dt)!

			// Punkt im q(t) Diagramm wird gezeichnet
			g.fillOval(sx(t) - 1, sy(s) - 1, 2, 2);
		}
		
		g.setColor(Color.BLACK);
		g.drawString("t = " + (int) t + "s", zeichenflaeche.getWidth()-100, 50);
	}

	public static void main(final String[] args) {
		EventQueue.invokeLater(new Runnable() {
			@Override
			public void run() {
				try {
					Federpendel anwendung = new Federpendel("Federpendel");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
}