package traffic.light.ui;

import java.awt.Dimension;
import java.awt.Graphics;

import javax.swing.JPanel;

public class CrossWalkPanel extends JPanel {

	private static final long serialVersionUID = -7137708533029709629L;
	protected TrafficLight trafficLight;
	protected Counter counter;
	
	public CrossWalkPanel() {
		super();
		trafficLight = new TrafficLight();
		counter = new Counter();
		add(trafficLight);
		add(counter);
		setPreferredSize(new Dimension(240,400));
		setVisible(true);
	}
	
	public TrafficLight getTrafficLightVis() {
		return trafficLight;
	}
	
	public Counter getCounterVis() {
		return counter;
	}

	public void paint(Graphics g) {
		paintTrafficLight(g);
		paintCounter(g);
		g.dispose();
	}

	protected void paintTrafficLight(Graphics g) {
		trafficLight.paint(g);
	}

	protected void paintCounter(Graphics g) {
		counter.paint(g);
	}
}
