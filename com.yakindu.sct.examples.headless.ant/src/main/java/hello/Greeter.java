package hello;

import com.yakindu.sct.examples.headless.ant.defaultsm.DefaultSMStatemachine;

public class Greeter {
	
	public String sayHello() {
		DefaultSMStatemachine sm = new DefaultSMStatemachine();
		sm.init();
		sm.enter();
		String ret = "";
		while (!sm.isFinal()) {
			sm.runCycle();
			ret += "Hello world!\n";
		}
		return ret;
	}
}
