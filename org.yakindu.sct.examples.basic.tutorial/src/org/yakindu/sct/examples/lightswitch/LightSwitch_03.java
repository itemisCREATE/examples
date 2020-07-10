package org.yakindu.sct.examples.lightswitch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.yakindu.sct.examples.basic.tutorial._03_LightSwitch;

public class LightSwitch_03 {

	public static void main(String[] args) throws InterruptedException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		_03_LightSwitch sm = new _03_LightSwitch();

		sm.init();
		sm.enter();

		while (true) {
			System.out.println("Choose 'On', 'Off' or 'Exit'");
			String input = br.readLine();

			if (input.equals("On")) {
				sm.getInterfaceUser().raiseOn_button();
			} else if (input.equals("Off")) {
				sm.getInterfaceUser().raiseOff_button();
			} else if (input.equals("Exit")) {
				break;
			} else {
				System.out.println("Incorrect input: " + input);
			}
			sm.runCycle();
			System.out.printf("Brightness: %d\n", sm.getInterfaceUser().getBrightness());
		}
	}
}
