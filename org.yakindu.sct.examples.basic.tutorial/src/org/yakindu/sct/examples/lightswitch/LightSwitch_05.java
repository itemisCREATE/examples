package org.yakindu.sct.examples.lightswitch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.time.LocalDateTime;
import java.util.Random;

import org.yakindu.sct.TimerService;
import org.yakindu.sct.examples.basic.tutorial._05_PresenceSimulationLightSwitch;
import org.yakindu.sct.examples.basic.tutorial._05_PresenceSimulationLightSwitch.State;

public class LightSwitch_05 {

	public static void main(String[] args) throws IOException {
		// Instantiate statemachine
		_05_PresenceSimulationLightSwitch sm = new _05_PresenceSimulationLightSwitch();

		// Instantiate BufferedReader for command line reading inside of IDE
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		TimerService timerService = new TimerService();
		sm.setTimerService(timerService);

		// provide operation callback
		sm.setInternalOperationCallback(new _05_PresenceSimulationLightSwitch.InternalOperationCallback() {

				@Override
				public double get_rand() {
					Random rand = new Random();
					return rand.nextFloat();
				}
	
				@Override
				public long get_hour() {
					LocalDateTime time = LocalDateTime.now();
					long hour = (long) (((float) time.getMinute()) / 2.5);
					System.out.printf("Hour: %d\n", hour);
					return hour;
				}
	
			}
		);

		sm.enter();

		long brightness = 0;

		boolean isManual = false;


		System.out.println(
				"Choose: \n	(s)witch\n"
						+ "	change (b)rightnes\n"
						+ "	toggle (m)ode\n"
						+ "	(e)xit\n");

		while (true) {
			// Only readLine when input is ready, kind of non-blocking
			String input = "";
			if (br.ready()) {
				input = br.readLine();
			}

			if (input.equals("s")) {
				sm.hmi().raiseSwitch();
			} else if (input.equals("b")) {
				sm.hmi().raiseChangeBrightness();
			} else if (input.equals("m")) {
				sm.hmi().raiseToggleMode();
			} else if (input.equals("e")) {
				System.out.println("bye... ");
				break;
			}


			// Output section
			if (sm.getBrightness() != brightness) {
				brightness = sm.getBrightness();
				System.out.printf("Brightness %d\n", brightness);
			}

			if (sm.isStateActive(State.MAIN_MANUAL) != isManual) {
				isManual = sm.isStateActive(State.MAIN_MANUAL);
				if (isManual) {
					System.out.println("Manual mode activated");
				} else {
					System.out.println("Presence simulation activated");
				}
			}

		}
		timerService.cancel();
	}
}
