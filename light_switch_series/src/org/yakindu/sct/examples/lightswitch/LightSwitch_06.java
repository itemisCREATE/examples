package org.yakindu.sct.examples.lightswitch;

//for console interface
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.yakindu.scr._06_lightswitch_simulation._06_LightSwitch_simulationStatemachine;
import org.yakindu.scr.TimerService;

public class LightSwitch_06 {

	public static void main(String[] args) throws IOException {
		// Instantiate statemachine
		_06_LightSwitch_simulationStatemachine sm = new _06_LightSwitch_simulationStatemachine();
		
		// Instantiate BufferedReader for command line reading inside of IDE
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		sm.setTimer(new TimerService());
		
		sm.setInternalOperationCallback(new LightSwitch_06_Callback());
		
		sm.init();
		sm.enter();
		
		long brightness = 0;
		
		boolean isManual = false;

		System.out.println("Choose 'On', 'Off' or 'Exit'. Everything else triggers the motion sensor.");
		
		while(true)
		{
			// Only readLine when input is ready, kind of non-blocking
			String input = "";
			if(br.ready())
			{
				input = br.readLine();
			}
			
			if(input.equals("On"))
			{
				sm.getSCIUser().raiseOn_button();
			}
			else if(input.equals("Off"))
			{
				sm.getSCIUser().raiseOff_button();
			}
			else if(input.equals("Exit"))
			{
				break;
			}
			
			sm.runCycle();
			
			// Output section
			if(sm.getSCIUser().getBrightness() != brightness)
			{
				brightness = sm.getSCIUser().getBrightness();
				System.out.printf("Brightness %d\n", brightness);
			}
			
			if(sm.isStateActive(_06_LightSwitch_simulationStatemachine.State.main_region_Manual) != isManual)
			{
				isManual = sm.isStateActive(_06_LightSwitch_simulationStatemachine.State.main_region_Manual);
				if(isManual)
				{
					System.out.println("Manual mode activated");
				}
				else {
					System.out.println("Presence simulation activated");
				}
			}
			
		}
	}
}
