/**
 * Copyright (c) 2016 committers of itemis CREATE and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * Contributors:
 * 	committers of itemis CREATE - initial API and implementation
 * 
 */
package traffic.light.ui;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JPanel;

public class TrafficLight extends JPanel {

	private boolean red = false;
	private boolean yellow = false;
	private boolean green = false;
	private BufferedImage trafficLight;
	private BufferedImage redLight;
	private BufferedImage greenLight;
	private BufferedImage yellowLight;
	
	public TrafficLight() {
		try {
			trafficLight = ImageIO.read(new File("resources/images/trafficlight_empty.jpg"));
			redLight = ImageIO.read(new File("resources/images/red_light.png"));
			greenLight = ImageIO.read(new File("resources/images/green_light.png"));
			yellowLight = ImageIO.read(new File("resources/images/yellow_light.png"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean isRed() {
		return red;
	}

	public void setRed(boolean red) {
		this.red = red;
	}

	public boolean isYellow() {
		return yellow;
	}

	public void setYellow(boolean yellow) {
		this.yellow = yellow;
	}

	public boolean isGreen() {
		return green;
	}

	public void setGreen(boolean green) {
		this.green = green;
	}

	private static final long serialVersionUID = 1L;

	@Override
	public void paint(Graphics graphics) {
		graphics.drawImage(trafficLight, 25, 25, null);
		if (green) {
			graphics.drawImage(greenLight, 26, 236, null);
		}
		if (red) {
			graphics.drawImage(redLight, 25, 25, null);
		}
		if (yellow) {
			graphics.drawImage(yellowLight, 26, 140, null);
		}
	}

}
