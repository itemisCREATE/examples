package org.yakindu.sct.examples.lightswitch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.yakindu.sct.TimerService;
import org.yakindu.sct.examples.basic.tutorial._04_LightSwitch;

public class LightSwitch_04 {

	public static void main(String[] args) throws IOException {
		// Instantiate statemachine
		_04_LightSwitch sm = new _04_LightSwitch();

		// Instantiate BufferedReader for command line reading inside of IDE
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		sm.setTimerService(new TimerService());

		sm.enter();

		long brightness = 0;

		System.out.println("Choose 'On', 'Off' or 'Exit'. Everything else triggers the motion sensor.");

		while (true) {
			// Only readLine when input is ready, kind of non-blocking
			String input = "";
			if (br.ready()) {
				input = br.readLine();
			}

			if (input.equals("On")) {
				sm.user().raiseOn_button();
			} else if (input.equals("Off")) {
				sm.user().raiseOff_button();
			} else if (input.equals("Exit")) {
				break;
			} else if (!input.equals("")) {
				sm.sensor().raiseMotion();
				System.out.println("Motion detected");
			}

			if (sm.user().getBrightness() != brightness) {
				brightness = sm.user().getBrightness();
				System.out.printf("Brightness %d\n", brightness);
			}

		}
	}

}
