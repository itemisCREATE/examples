/** Copyright (c) 2012-2015 committers of YAKINDU and others.
				All rights reserved. This program and the accompanying materials
				are made available under the terms of the Eclipse Public License v1.0
				which accompanies this distribution, and is available at
				http://www.eclipse.org/legal/epl-v10.html
				
				Contributors:
				    committers of YAKINDU - initial API and implementation
				� */
package traffic.light;

import org.yakindu.sct.IStatemachine;
import org.yakindu.sct.ITimerCallback;

public interface ITrafficLightCtrl extends ITimerCallback,IStatemachine {
	
	public interface InterfaceTrafficLight {
	
		public boolean getRed();
		
		public void setRed(boolean value);
		
		public boolean getYellow();
		
		public void setYellow(boolean value);
		
		public boolean getGreen();
		
		public void setGreen(boolean value);
		
	}
	
	public InterfaceTrafficLight getInterfaceTrafficLight();
	
	
	public interface InterfacePedestrian {
	
		public boolean getRequest();
		
		public void setRequest(boolean value);
		
		public boolean getRed();
		
		public void setRed(boolean value);
		
		public boolean getGreen();
		
		public void setGreen(boolean value);
		
	}
	
	public InterfacePedestrian getInterfacePedestrian();
	
	
	public interface Interface {
	
		public void raisePedestrianRequest();
		
		public void raiseOnOff();
		
		public void setInterfaceOperationCallback(InterfaceOperationCallback operationCallback);
	}
	
	public interface InterfaceOperationCallback {
	
		public void synchronize();
		
	}
	
	public Interface getInterface();
	
}
