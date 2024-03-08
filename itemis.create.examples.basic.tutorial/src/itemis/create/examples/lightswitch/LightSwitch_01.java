package itemis.create.examples.lightswitch;

import itemis.create.examples.basic.tutorial._01_LightSwitch;

public class LightSwitch_01 {

	public static void main(String[] args) throws InterruptedException {
		_01_LightSwitch sm = new _01_LightSwitch();

		sm.enter();

		for (int i = 0; i < 10; i++) {
			sm.raiseSwitch();;

			if (sm.isStateActive(_01_LightSwitch.State.MAIN_ON)) {
				System.out.println("Light is On");
			} else if (sm.isStateActive(_01_LightSwitch.State.MAIN_OFF)) {
				System.out.println("Light is Off");
			}

		}
	}
}
