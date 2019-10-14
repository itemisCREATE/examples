package org.yakindu.sct.examples.codegen.java;

import java.util.Scanner;

import org.yakindu.sct.examples.codegen.java.lightswitch.LightSwitchStatemachine;

public class Main {

	public static void main(String[] args) {

		LightSwitchStatemachine lightSwitch = new LightSwitchStatemachine();
		lightSwitch.init();
		lightSwitch.enter();

		userInteraction(lightSwitch);
	}

	@SuppressWarnings("resource")
	private static void userInteraction(LightSwitchStatemachine lightSwitch) {
		System.out.println("Interact with the light switch [On]/[Off]:");
		Scanner sc = new Scanner(System.in).useDelimiter("\\s");
		while (!lightSwitch.isFinal()) {
			String action = sc.next();
			if ("On".equals(action)) {
				// raise the "on" event
				lightSwitch.getSCIUser().raiseOn_button();
				printStatus(lightSwitch);
				
			} else if ("Off".equals(action)) {
				// raise the "off" event
				lightSwitch.getSCIUser().raiseOff_button();
				printStatus(lightSwitch);
			}
		}
		sc.close();
	}

	private static void printStatus(LightSwitchStatemachine lightSwitch) {
		if (lightSwitch.isStateActive(LightSwitchStatemachine.State.main_region_On)) {
			long brightness = lightSwitch.getSCIUser().getBrightness();
			System.out.println("Light Switch is ON [brightness=" + brightness + "]");
		} else {
			System.out.println("Light Switch is OFF");
		}
	}

}

