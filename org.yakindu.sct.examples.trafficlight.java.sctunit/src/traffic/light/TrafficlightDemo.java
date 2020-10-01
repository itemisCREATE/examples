/**
 * Copyright (c) 2016 committers of YAKINDU and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 * Contributors:
 * 	committers of YAKINDU - initial API and implementation
 * 
 */
package traffic.light;

import java.awt.BorderLayout;
import java.awt.Graphics;

import javax.swing.JFrame;

import com.yakindu.sct.RuntimeService;
import com.yakindu.sct.TimerService;


/**
 * 
 * @author Tesch
 *
 */
public class TrafficlightDemo extends JFrame {

	private static final long serialVersionUID = -8909693541678814631L;

	protected TrafficLightCtrl statemachine;

	protected TimerService timerService;

	private CrossWalkPanel crossing;

	private ButtonPanel buttonPanel;

	public static void main(String[] args) {
		TrafficlightDemo application = new TrafficlightDemo();
		application.createContents();
		application.setupStatemachine();
		application.run();
	}

	protected void run() {
		statemachine.enter();
		RuntimeService.getInstance().registerStatemachine(statemachine, 100);
	}

	protected void createContents() {
		setLayout(new BorderLayout());
		setTitle("Crosswalk traffic light");
		crossing = new CrossWalkPanel();
		add(BorderLayout.CENTER, crossing);
		buttonPanel = new ButtonPanel();
		add(BorderLayout.SOUTH, buttonPanel);
		setSize(440, 440);
		setVisible(true);
	}

	@Override
	public void paint(Graphics g) {
		super.paint(g);
	}

	protected void setupStatemachine() {
		statemachine = new TrafficLightCtrl();
		timerService = new TimerService();
		statemachine.setTimerService(timerService);
		statemachine.setOperationCallback(new TrafficLightCtrl.OperationCallback() {
			@Override
			public void synchronize() {
				checkTrafficLightStates();
				repaint();
			}
		});
		
		buttonPanel.getPedestrianRequest()
				.addActionListener(e -> statemachine.raisePedestrianRequest());
		buttonPanel.getOnOff().addActionListener(e -> statemachine.raiseOnOff());
	}

	
	protected void checkTrafficLightStates() {

		crossing.getTrafficLight().setRed(statemachine.trafficLight().getRed());
		crossing.getTrafficLight().setYellow(statemachine.trafficLight().getYellow());
		crossing.getTrafficLight().setGreen(statemachine.trafficLight().getGreen());

		crossing.getPedLight().setRed(statemachine.pedestrian().getRed());
		crossing.getPedLight().setGreen(statemachine.pedestrian().getGreen());
		crossing.getPedLight().setWhite(statemachine.pedestrian().getRequest());
	}
}
