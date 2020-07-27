package org.yakindu.sct.examples.lightswitch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.yakindu.sct.TimerService;
import org.yakindu.sct.examples.basic.tutorial._06_LightSwitch_simulation;
import org.yakindu.sct.examples.basic.tutorial._06_LightSwitch_simulation.State;

public class LightSwitch_06 {

	public static void main(String[] args) throws IOException {
		// Instantiate statemachine
		_06_LightSwitch_simulation sm = new _06_LightSwitch_simulation();

		// Instantiate BufferedReader for command line reading inside of IDE
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		sm.setTimer(new TimerService());

		sm.setInternalOperationCallback(new LightSwitch_06_Callback());

		sm.init();
		sm.enter();

		long brightness = 0;

		boolean isManual = false;

		System.out.println("Choose 'On', 'Off' or 'Exit'. Everything else triggers the motion sensor.");

		while (true) {
			// Only readLine when input is ready, kind of non-blocking
			String input = "";
			if (br.ready()) {
				input = br.readLine();
			}

			if (input.equals("On")) {
				sm.getInterfaceUser().raiseOn_button();
			} else if (input.equals("Off")) {
				sm.getInterfaceUser().raiseOff_button();
			} else if (input.equals("Exit")) {
				break;
			}

			sm.runCycle();

			// Output section
			if (sm.getInterfaceUser().getBrightness() != brightness) {
				brightness = sm.getInterfaceUser().getBrightness();
				System.out.printf("Brightness %d\n", brightness);
			}

			if (sm.isStateActive(State.MAIN_REGION_MANUAL) != isManual) {
				isManual = sm.isStateActive(State.MAIN_REGION_MANUAL);
				if (isManual) {
					System.out.println("Manual mode activated");
				} else {
					System.out.println("Presence simulation activated");
				}
			}

		}
	}
}
