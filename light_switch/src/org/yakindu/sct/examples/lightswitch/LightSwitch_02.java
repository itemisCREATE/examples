package org.yakindu.sct.examples.lightswitch;

import org.yakindu.scr._02_lightswitch._02_LightSwitchStatemachine;


public class LightSwitch_02 {
	public static void main(String[] args) throws InterruptedException {
		_02_LightSwitchStatemachine sm = new _02_LightSwitchStatemachine();
		
		sm.init();
		
		sm.enter();
		
		for(int i = 0; i < 10; i++)
		{
			sm.getSCIUser().raiseOperate();
			sm.runCycle();
			
			if(sm.isStateActive(_02_LightSwitchStatemachine.State.main_region_On))
			{
				System.out.println("Light is On");
			}
			else if(sm.isStateActive(_02_LightSwitchStatemachine.State.main_region_Off))
			{
				System.out.println("Light is Off");
			}
				
		}
	}
}
