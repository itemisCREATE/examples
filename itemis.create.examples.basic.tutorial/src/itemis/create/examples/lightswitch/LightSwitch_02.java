package itemis.create.examples.lightswitch;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import itemis.create.examples.basic.tutorial._02_DimmableLightSwitch;

public class LightSwitch_02 {

	public static void main(String[] args) throws InterruptedException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		_02_DimmableLightSwitch sm = new _02_DimmableLightSwitch();

		sm.enter();

		while (true) {
			System.out.println("Choose '(s)witch', 'change (b)rightness' or '(e)xit'");
			String input = br.readLine();

			if (input.equals("s")) {
				sm.raiseSwitch();
			} else if (input.equals("b")) {
				sm.raiseChangeBrightness();
			} else if (input.equals("e")) {
				System.out.println("bye... ");
				break;
			} else {
				System.out.println("Incorrect input: " + input);
			}
			System.out.printf("Brightness: %d\n", sm.getBrightness());
		}
	}
}
