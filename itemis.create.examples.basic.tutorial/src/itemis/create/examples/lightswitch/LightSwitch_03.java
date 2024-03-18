package itemis.create.examples.lightswitch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import itemis.create.TimerService;
import itemis.create.examples.basic.tutorial._03_MotionLightSwitch;

public class LightSwitch_03 {

	public static void main(String[] args) throws IOException {
		// Instantiate statemachine
		_03_MotionLightSwitch sm = new _03_MotionLightSwitch();

		// Instantiate BufferedReader for command line reading inside of IDE
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		TimerService timerService = new TimerService();
		sm.setTimerService(timerService);

		sm.enter();

		long brightness = 0;

		System.out.println(
				"Choose: \n	(s)witch\n"
						+ "	change (b)rightnes\n"
						+ "	toggle (m)ode\n"
						+ "	(e)xit\n"
						+ "	Everything else triggers the motion sensor.");

		while (true) {
			// Only readLine when input is ready, kind of non-blocking
			String input = "";
			if (br.ready()) {
				input = br.readLine();
			}

			if (input.equals("s")) {
				sm.raiseSwitch();
			} else if (input.equals("b")) {
				sm.raiseChangeBrightness();
			} else if (input.equals("m")) {
				sm.raiseToggleMode();
			} else if (input.equals("e")) {
				System.out.println("bye... ");
				break;
			} else if (!input.equals("")) {
				sm.raiseMotionDetected();
				System.out.println("Motion detected");
			}

			if (sm.getBrightness() != brightness) {
				brightness = sm.getBrightness();
				System.out.printf("Brightness %d\n", brightness);
			}

		}
		
		timerService.cancel();
	}

}
