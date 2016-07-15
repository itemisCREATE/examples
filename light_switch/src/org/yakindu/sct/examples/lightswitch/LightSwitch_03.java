package org.yakindu.sct.examples.lightswitch;

// for console interface
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.yakindu.scr._03_lightswitch._03_LightSwitchStatemachine;

public class LightSwitch_03 {
	public static void main(String[] args) throws InterruptedException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		_03_LightSwitchStatemachine sm = new _03_LightSwitchStatemachine();
		
		sm.init();
		sm.enter();
		
		while(true)
		{
			System.out.println("Choose 'On', 'Off' or 'Exit'");
			String input = br.readLine();
			
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
			else
			{
				System.out.println("Incorrect input: " + input);
			}
			sm.runCycle();
			System.out.printf("Brightness: %d\n", sm.getSCIUser().getBrightness());
		}
	}
}
