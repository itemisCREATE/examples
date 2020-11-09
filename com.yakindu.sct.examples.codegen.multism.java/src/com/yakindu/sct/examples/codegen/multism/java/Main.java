package com.yakindu.sct.examples.codegen.multism.java;

import java.util.Scanner;

import com.yakindu.core.TimerService;
import com.yakindu.sct.examples.codegen.multism.java.controller.LightController;
import com.yakindu.sct.examples.codegen.multism.java.light.Light;

public class Main {

	public static void main(String[] args) {
		/* Instantiates the controller state machine */
		LightController controller = new LightController();
		
		/* Sets the timer service */
		controller.setTimerService(new TimerService());

		/* Instantiates and sets the sub machines */
		Light light1 = new Light();
		Light light2 = new Light();
		controller.setLight1(light1);
		controller.setLight2(light2);

		/* Subscribes reaction on out event observables */
		light1.getBrightness_changed().subscribe((value) -> System.out.println("Light 1 Brightness: " + value));
		light2.getBrightness_changed().subscribe((value) -> System.out.println("Light 2 Brightness: " + value));
		
		/* Enters the state machine; from this point on the state machine is ready to react on incoming event */
		controller.enter();
		
		userInteraction(controller);
	}
	
	private static void userInteraction(LightController controller) {
		System.out.println(
				"Type 'On' or 'Off' to switch the lights on or off.\n" +
				"Type 'Blink' to toggle the blink mode.");
		Scanner sc = new Scanner(System.in);
		sc.useDelimiter("\\s");
		while (!controller.isFinal()) {
			String action = sc.next();
			if ("On".equals(action)) {
				/* Raises the On event in the state machine which causes the corresponding transition to be taken */
				controller.user().raiseSwitch_on();
			} else if ("Off".equals(action)) {
				/* Raises the Off event in the state machine */
				controller.user().raiseSwitch_off();
			} else if ("Blink".equals(action)) {
				/* Raises the Off event in the state machine */
				controller.user().raiseBlink_mode();
			}
		}
		sc.close();
	}

}
