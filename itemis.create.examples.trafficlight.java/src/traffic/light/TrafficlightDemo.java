package traffic.light;

import itemis.create.core.ITimerService;
import itemis.create.core.TimerService;

import traffic.light.ui.Counter.Color;
import traffic.light.ui.TrafficLightFrame;

public class TrafficlightDemo extends TrafficLightFrame {

	private static final long serialVersionUID = -8909693541678814631L;

	protected TrafficLightCtrl statemachine;

	protected ITimerService timerService;
	
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
		timerService = new TimerService();
		statemachine.setTimerService(timerService);
		
		statemachine.trafficLight().getDisplayRed().subscribe((e) ->    setLights(true, false, false));
		statemachine.trafficLight().getDisplayYellow().subscribe((e) -> setLights(false, true, false));
		statemachine.trafficLight().getDisplayGreen().subscribe((e) ->  setLights(false, false, true));
		statemachine.trafficLight().getDisplayNone().subscribe((e) ->   setLights(false, false, false));
		
		statemachine.timer().getUpdateTimerValue().subscribe((value) -> {
			crossing.getCounterVis().setCounterValue(value);
			repaint();
		});
		statemachine.timer().getUpdateTimerColour().subscribe((value) -> {
			crossing.getCounterVis().setColor(value == "Red" ? Color.RED : Color.GREEN);
		});

		buttonPanel.getPoliceInterrupt().addActionListener(e -> statemachine.raisePolice_interrupt());

		buttonPanel.getSwitchOnOff().addActionListener(e -> statemachine.raiseToggle());
	}
	
	private void setLights(boolean red, boolean yellow, boolean green) {
		crossing.getTrafficLightVis().setRed(red);
		crossing.getTrafficLightVis().setYellow(yellow);
		crossing.getTrafficLightVis().setGreen(green);
		repaint();
	}
}
