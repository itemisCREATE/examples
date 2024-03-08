package itemis.create.examples.codegen.java;

import java.util.Scanner;

import itemis.create.core.TimerService;
import itemis.create.core.rx.Observer;

public class Main {
	
	/* Observer with callback for the light.on event */
	static class LightOnObserver implements Observer<Void>{
		@Override
		public void next(Void value) {
			System.out.println("Light is on.");
		}
	}
	
	/* Observer with callback for the light.off event */
	static class LightOffObserver implements Observer<Void>{
		@Override
		public void next(Void value) {
			System.out.println("Light is off.");
		}
	}
	
	public static void main(String[] args) {
		/* Instantiates the state machine */
		LightSwitch lightSwitch = new LightSwitch();
		
		/* Set the timer service */
		lightSwitch.setTimerService(new TimerService());
		
		/* Subscribes observers to the state machine's observables */
		lightSwitch.light().getOn().subscribe(new LightOnObserver());
		lightSwitch.light().getOff().subscribe(new LightOffObserver());
		
		/* Enters the state machine; from this point on the state machine is ready to react on incoming event */
		lightSwitch.enter();

		userInteraction(lightSwitch);
	}

	private static void userInteraction(LightSwitch lightSwitch) {
		System.out.println("Type 'On' or 'Off' to switch the light on or off.");
		Scanner sc = new Scanner(System.in);
		sc.useDelimiter("\\s");
		while (!lightSwitch.isFinal()) {
			String action = sc.next();
			if ("On".equals(action)) {
				/* Raises the On event in the state machine which causes the corresponding transition to be taken */
				lightSwitch.user().raiseOn_button();
				printStatus(lightSwitch);
				
			} else if ("Off".equals(action)) {
				/* Raises the Off event in the state machine */
				lightSwitch.user().raiseOff_button();
				printStatus(lightSwitch);
			}
		}
		sc.close();
	}

	private static void printStatus(LightSwitch lightSwitch) {
		/* Gets the value of the brightness variable */
		long brightness = lightSwitch.light().getBrightness();
		System.out.println("Brightness: " + brightness + ".");
	}

}

