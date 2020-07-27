package org.yakindu.sct.examples.codegen.java;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		LightSwitch lightSwitch = new LightSwitch();
		lightSwitch.init();
		lightSwitch.enter();

		userInteraction(lightSwitch);
	}

	@SuppressWarnings("resource")
	private static void userInteraction(LightSwitch lightSwitch) {
		System.out.println("Interact with the light switch [On]/[Off]:");
		Scanner sc = new Scanner(System.in).useDelimiter("\\s");
		while (!lightSwitch.isFinal()) {
			String action = sc.next();
			if ("On".equals(action)) {
				// raise the "on" event
				lightSwitch.getInterfaceUser().raiseOn_button();
				printStatus(lightSwitch);
				
			} else if ("Off".equals(action)) {
				// raise the "off" event
				lightSwitch.getInterfaceUser().raiseOff_button();
				printStatus(lightSwitch);
			}
		}
		sc.close();
	}

	private static void printStatus(LightSwitch lightSwitch) {
		if (lightSwitch.isStateActive(LightSwitch.State.MAIN_REGION_ON)) {
			long brightness = lightSwitch.getInterfaceUser().getBrightness();
			System.out.println("Light Switch is ON [brightness=" + brightness + "]");
		} else {
			System.out.println("Light Switch is OFF");
		}
	}

}

