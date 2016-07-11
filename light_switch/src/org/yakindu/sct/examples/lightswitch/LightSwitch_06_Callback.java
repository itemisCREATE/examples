package org.yakindu.sct.examples.lightswitch;

import java.time.LocalDateTime;
import java.util.Random;

import org.yakindu.scr._06_lightswitch_simulation.I_06_LightSwitch_simulationStatemachine.InternalOperationCallback;

public class LightSwitch_06_Callback implements InternalOperationCallback {

	@Override
	public double get_rand() {
		Random rand = new Random();
		return rand.nextFloat();
	}

	@Override
	public long get_hour() {
		LocalDateTime time = LocalDateTime.now();
		long hour = (long)(((float)time.getMinute())/2.5);
		System.out.printf("Hour: %d\n", hour);
		return hour;
	}

}
