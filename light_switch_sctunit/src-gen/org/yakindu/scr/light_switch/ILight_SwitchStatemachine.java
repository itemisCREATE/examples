package org.yakindu.scr.light_switch;

import org.yakindu.scr.IStatemachine;

public interface ILight_SwitchStatemachine extends IStatemachine {

	public interface SCInterface {
	
		public void raiseOperate();
		
	}
	
	public SCInterface getSCInterface();
	
}
