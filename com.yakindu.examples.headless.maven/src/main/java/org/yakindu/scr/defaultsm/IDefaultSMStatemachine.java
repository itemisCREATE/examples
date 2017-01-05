package org.yakindu.scr.defaultsm;

import org.yakindu.scr.IStatemachine;

public interface IDefaultSMStatemachine extends IStatemachine {

	public interface SCInterface {
	
		public long getA();
		
		public void setA(long value);
		
	}
	
	public SCInterface getSCInterface();
	
}
