package org.yakindu.sct.examples.lightswitch;

//for console interface
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.yakindu.scr._04_lightswitch._04_LightSwitchStatemachine;
import org.yakindu.scr.TimerService;

public class LightSwitch_04 {

	public static void main(String[] args) throws IOException {
		// Instantiate statemachine
		_04_LightSwitchStatemachine sm = new _04_LightSwitchStatemachine();
		
		// Instantiate BufferedReader for command line reading inside of IDE
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		sm.setTimer(new TimerService());
		
		sm.init();
		sm.enter();
		
		long brightness = 0;

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
			else if(!input.equals(""))
			{
				sm.getSCISensor().raiseMotion();
				System.out.println("Motion detected");
			}
			
			sm.runCycle();
			if(sm.getSCIUser().getBrightness() != brightness)
			{
				brightness = sm.getSCIUser().getBrightness();
				System.out.printf("Brightness %d\n", brightness);
			}
			
		}
	}

}
