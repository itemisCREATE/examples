/**
 * Copyright (c) 2016 committers of CREATE and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * Contributors:
 * 	committers of CREATE - initial API and implementation
 * 
 */
package traffic.light.ui;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.JPanel;

public class Counter extends JPanel {

	private long counterValue = -1;

	private BufferedImage emptyCounter;
	private BufferedImage verticalBar;
	private BufferedImage horizontalBar;
	private BufferedImage verticalBarGreen;
	private BufferedImage horizontalBarGreen;
	private Color color;
	
	private static final long serialVersionUID = 1L;
	
	public enum Color {
		GREEN,
		RED;
	}
	
	public Counter() {
		try {
			emptyCounter = ImageIO.read(new File("resources/images/counter_empty.png"));
			verticalBar = ImageIO.read(new File("resources/images/vertical_bar.png"));
			horizontalBar = ImageIO.read(new File("resources/images/horizontal_bar.png"));
			verticalBarGreen = ImageIO.read(new File("resources/images/vertical_bar_green.png"));
			horizontalBarGreen = ImageIO.read(new File("resources/images/horizontal_bar_green.png"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public long getCounterValue() {
		return counterValue;
	}

	public void setCounterValue(long counterValue) {
		this.counterValue = counterValue;
	}
	
	public void setColor(Color color) {
		this.color = color;
	}
	
	public Color getColor() {
		return color;
	}
	
	private void upperRight(Graphics graphics, boolean left) {
		int x = 158;
		if (left) {
			x -= 55;
		}
		int y = 407;
		graphics.drawImage(this.color == Color.RED ? verticalBar : verticalBarGreen, x, y, null);
	}
	
	private void lowerRight(Graphics graphics, boolean left) {
		int x = 153;
		if (left) {
			x -= 55;
		}
		int y = 435;
		graphics.drawImage(this.color == Color.RED ? verticalBar : verticalBarGreen, x, y, null);
	}
	
	private void upperLeft(Graphics graphics, boolean left) {
		int x = 128;
		if (left) {
			x -= 55;
		}
		int y = 407;
		graphics.drawImage(this.color == Color.RED ? verticalBar : verticalBarGreen, x, y, null);
	}

	private void lowerLeft(Graphics graphics, boolean left) {
		int x = 123;
		if (left) {
			x -= 55;
		}
		int y = 435;
		graphics.drawImage(this.color == Color.RED ? verticalBar : verticalBarGreen, x, y, null);
	}

	private void top(Graphics graphics, boolean left) {
		int x = 134;
		if (left) {
			x -= 55;
		}
		int y = 405;
		graphics.drawImage(this.color == Color.RED ? horizontalBar : horizontalBarGreen, x, y, null);
	}

	private void mid(Graphics graphics, boolean left) {
		int x = 130;
		if (left) {
			x -= 55;
		}
		int y = 433;
		graphics.drawImage(this.color == Color.RED ? horizontalBar : horizontalBarGreen, x, y, null);
	}

	private void bot(Graphics graphics, boolean left) {
		int x = 126;
		if (left) {
			x -= 55;
		}
		int y = 459;
		graphics.drawImage(this.color == Color.RED ? horizontalBar : horizontalBarGreen, x, y, null);
	}
	
	private void paintNumber(int value, Graphics graphics, boolean left) {		
		switch (value) {
			case 0:
				this.top(graphics, left);
				this.upperRight(graphics, left);
				this.lowerRight(graphics, left);
				this.upperLeft(graphics, left);
				this.lowerLeft(graphics, left);
				this.bot(graphics, left);
				break;
			case 1:
				this.upperRight(graphics, left);
				this.lowerRight(graphics, left);
				break;
			case 2:
				this.top(graphics, left);
				this.upperRight(graphics, left);
				this.mid(graphics, left);
				this.lowerLeft(graphics, left);
				this.bot(graphics, left);
				break;
			case 3:
				this.top(graphics, left);
				this.upperRight(graphics, left);
				this.mid(graphics, left);
				this.lowerRight(graphics, left);
				this.bot(graphics, left);
				break;
			case 4:
				this.upperLeft(graphics, left);
				this.mid(graphics, left);
				this.upperRight(graphics, left);
				this.lowerRight(graphics, left);
				break;
			case 5:
				this.top(graphics, left);
				this.upperLeft(graphics, left);
				this.mid(graphics, left);
				this.lowerRight(graphics, left);
				this.bot(graphics, left);
				break;
			case 6:
				this.upperLeft(graphics, left);
				this.lowerLeft(graphics, left);
				this.mid(graphics, left);
				this.bot(graphics, left);
				this.lowerRight(graphics, left);
				break;
			case 7:
				this.top(graphics, left);
				this.upperRight(graphics, left);
				this.lowerRight(graphics, left);
				break;
			case 8:
				this.top(graphics, left);
				this.mid(graphics, left);
				this.bot(graphics, left);
				this.upperRight(graphics, left);
				this.lowerRight(graphics, left);
				this.upperLeft(graphics, left);
				this.lowerLeft(graphics, left);
				break;
			case 9:
				this.top(graphics, left);
				this.mid(graphics, left);
				this.upperRight(graphics, left);
				this.lowerRight(graphics, left);
				this.upperLeft(graphics, left);
		}
	}

	@Override
	public void paint(Graphics graphics) {
		graphics.drawImage(emptyCounter, 65, 400, null);
		
		if (counterValue >= 0) {
			int leftValue = (int) counterValue / 10;
			int rightValue = (int) counterValue % 10;
			
			this.paintNumber(leftValue, graphics, true);
			this.paintNumber(rightValue, graphics, false);
		}
	}

}
