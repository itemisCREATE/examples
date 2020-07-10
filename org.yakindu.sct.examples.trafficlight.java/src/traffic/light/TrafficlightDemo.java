package traffic.light;

import org.yakindu.sct.ITimer;
import org.yakindu.sct.TimerService;

import traffic.light.ui.Counter.Color;
import traffic.light.ui.TrafficLightFrame;

public class TrafficlightDemo extends TrafficLightFrame {

	private static final long serialVersionUID = -8909693541678814631L;

	protected TrafficLightCtrl statemachine;

	protected ITimer timer;
	
	public static void main(String[] args) {
		TrafficlightDemo application = new TrafficlightDemo();
		application.init();
		
		application.setupStatemachine();
		
		application.run();
	}

	protected void run() {
		statemachine.enter();
	}


	protected void setupStatemachine() {
		statemachine = new TrafficLightCtrl();
		timer = new TimerService();
		statemachine.setTimer(timer);
		
		statemachine.getInterfaceTrafficLight().getDisplayRed().subscribe((e) ->    setLights(true, false, false));
		statemachine.getInterfaceTrafficLight().getDisplayYellow().subscribe((e) -> setLights(false, true, false));
		statemachine.getInterfaceTrafficLight().getDisplayGreen().subscribe((e) ->  setLights(false, false, true));
		statemachine.getInterfaceTrafficLight().getDisplayNone().subscribe((e) ->   setLights(false, false, false));
		
		statemachine.getInterfaceTimer().getUpdateTimerValue().subscribe((value) -> {
			crossing.getCounterVis().setCounterValue(value);
			repaint();
		});
		statemachine.getInterfaceTimer().getUpdateTimerColour().subscribe((value) -> {
			crossing.getCounterVis().setColor(value == "Red" ? Color.RED : Color.GREEN);
		});

		buttonPanel.getPoliceInterrupt().addActionListener(e -> statemachine.getInterface().raisePolice_interrupt());

		buttonPanel.getSwitchOnOff().addActionListener(e -> statemachine.getInterface().raiseToggle());

		statemachine.init();
	}
	
	private void setLights(boolean red, boolean yellow, boolean green) {
		crossing.getTrafficLightVis().setRed(red);
		crossing.getTrafficLightVis().setYellow(yellow);
		crossing.getTrafficLightVis().setGreen(green);
		repaint();
	}
}
