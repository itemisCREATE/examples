/** Copyright (c) 2012-2015 committers of YAKINDU and others.
				All rights reserved. This program and the accompanying materials
				are made available under the terms of the Eclipse Public License v1.0
				which accompanies this distribution, and is available at
				http://www.eclipse.org/legal/epl-v10.html
				
				Contributors:
				    committers of YAKINDU - initial API and implementation
				� */
package traffic.light;

import org.yakindu.sct.ITimer;

public class TrafficLightCtrl implements ITrafficLightCtrl {
	protected class InterfaceTrafficLightImpl implements InterfaceTrafficLight {
	
		private boolean red;
		
		public synchronized boolean getRed() {
			synchronized(TrafficLightCtrl.this) {
				return red;
			}
		}
		
		public void setRed(boolean value) {
			synchronized(TrafficLightCtrl.this) {
				this.red = value;
			}
		}
		
		private boolean yellow;
		
		public synchronized boolean getYellow() {
			synchronized(TrafficLightCtrl.this) {
				return yellow;
			}
		}
		
		public void setYellow(boolean value) {
			synchronized(TrafficLightCtrl.this) {
				this.yellow = value;
			}
		}
		
		private boolean green;
		
		public synchronized boolean getGreen() {
			synchronized(TrafficLightCtrl.this) {
				return green;
			}
		}
		
		public void setGreen(boolean value) {
			synchronized(TrafficLightCtrl.this) {
				this.green = value;
			}
		}
		
	}
	
	protected class InterfacePedestrianImpl implements InterfacePedestrian {
	
		private boolean request;
		
		public synchronized boolean getRequest() {
			synchronized(TrafficLightCtrl.this) {
				return request;
			}
		}
		
		public void setRequest(boolean value) {
			synchronized(TrafficLightCtrl.this) {
				this.request = value;
			}
		}
		
		private boolean red;
		
		public synchronized boolean getRed() {
			synchronized(TrafficLightCtrl.this) {
				return red;
			}
		}
		
		public void setRed(boolean value) {
			synchronized(TrafficLightCtrl.this) {
				this.red = value;
			}
		}
		
		private boolean green;
		
		public synchronized boolean getGreen() {
			synchronized(TrafficLightCtrl.this) {
				return green;
			}
		}
		
		public void setGreen(boolean value) {
			synchronized(TrafficLightCtrl.this) {
				this.green = value;
			}
		}
		
	}
	
	protected class InterfaceImpl implements Interface {
	
		private InterfaceOperationCallback operationCallback;
		
		public synchronized void setInterfaceOperationCallback(
				InterfaceOperationCallback operationCallback) {
			this.operationCallback = operationCallback;
		}
		private boolean pedestrianRequest;
		
		
		public void raisePedestrianRequest() {
			synchronized(TrafficLightCtrl.this) {
				pedestrianRequest = true;
			}
		}
		
		private boolean onOff;
		
		
		public void raiseOnOff() {
			synchronized(TrafficLightCtrl.this) {
				onOff = true;
			}
		}
		
	}
	
	private static class InterfaceEvBuf {
		private boolean pedestrianRequest;
		private boolean onOff;
	}
	private static class TrafficLightCtrlTimeEventsEvBuf {
		private boolean trafficLightCtrl_main_region_on_r1_PedWaiting_time_event_0;
		private boolean trafficLightCtrl_main_region_on_r1_PedWaiting_r1_waitOn_time_event_0;
		private boolean trafficLightCtrl_main_region_on_r1_PedWaiting_r1_waitOff_time_event_0;
		private boolean trafficLightCtrl_main_region_on_r1_StreetAttention_time_event_0;
		private boolean trafficLightCtrl_main_region_on_r1_StreetRed_time_event_0;
		private boolean trafficLightCtrl_main_region_on_r1_PedestrianGreen_time_event_0;
		private boolean trafficLightCtrl_main_region_on_r1_PedestrianRed_time_event_0;
		private boolean trafficLightCtrl_main_region_on_r1_StreetPrepare_time_event_0;
		private boolean trafficLightCtrl_main_region_on_r1_Safe_time_event_0;
		private boolean trafficLightCtrl_main_region_off_r1_YellowOn_time_event_0;
		private boolean trafficLightCtrl_main_region_off_r1_YellowOff_time_event_0;
		private boolean trafficLightCtrl_time_event_0;
	}
	private static class TrafficLightCtrlEvBuf {
		private InterfaceEvBuf iface = new InterfaceEvBuf();
		private TrafficLightCtrlTimeEventsEvBuf timeEvents = new TrafficLightCtrlTimeEventsEvBuf();
	}
	protected InterfaceTrafficLightImpl interfaceTrafficLight;
	
	protected InterfacePedestrianImpl interfacePedestrian;
	
	protected InterfaceImpl defaultInterface;
	
	private boolean initialized = false;
	
	public enum State {
		MAIN_REGION_ON,
		MAIN_REGION_ON_R1_STREETGREEN,
		MAIN_REGION_ON_R1_PEDWAITING,
		MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON,
		MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF,
		MAIN_REGION_ON_R1_STREETATTENTION,
		MAIN_REGION_ON_R1_STREETRED,
		MAIN_REGION_ON_R1_PEDESTRIANGREEN,
		MAIN_REGION_ON_R1_PEDESTRIANRED,
		MAIN_REGION_ON_R1_STREETPREPARE,
		MAIN_REGION_ON_R1_SAFE,
		MAIN_REGION_OFF,
		MAIN_REGION_OFF_R1_YELLOWON,
		MAIN_REGION_OFF_R1_YELLOWOFF,
		$NULLSTATE$
	};
	
	private final State[] stateVector = new State[1];
	
	private int nextStateIndex;
	
	private ITimer timer;
	
	private final boolean[] timeEvents = new boolean[12];
	
	private TrafficLightCtrlEvBuf _current = new TrafficLightCtrlEvBuf();
	
	private boolean isExecuting;
	
	protected boolean getIsExecuting() {
		synchronized(TrafficLightCtrl.this) {
			return isExecuting;
		}
	}
	
	protected void setIsExecuting(boolean value) {
		synchronized(TrafficLightCtrl.this) {
			this.isExecuting = value;
		}
	}
	public TrafficLightCtrl() {
		interfaceTrafficLight = new InterfaceTrafficLightImpl();
		interfacePedestrian = new InterfacePedestrianImpl();
		defaultInterface = new InterfaceImpl();
	}
	
	public synchronized void init() {
		this.initialized = true;
		if (timer == null) {
			throw new IllegalStateException("timer not set.");
		}
		if (this.defaultInterface.operationCallback == null) {
			throw new IllegalStateException("Operation callback for interface Interface must be set.");
		}
		
		for (int i = 0; i < 1; i++) {
			stateVector[i] = State.$NULLSTATE$;
		}
		
		clearInEvents();
		
		interfaceTrafficLight.setRed(false);
		
		interfaceTrafficLight.setYellow(false);
		
		interfaceTrafficLight.setGreen(false);
		
		interfacePedestrian.setRequest(false);
		
		interfacePedestrian.setRed(false);
		
		interfacePedestrian.setGreen(false);
		
		isExecuting = false;
	}
	
	public synchronized void enter() {
		if (!initialized)
			throw new IllegalStateException(
			        "The state machine needs to be initialized first by calling the init() function.");
		if (timer == null) {
			throw new IllegalStateException("timer not set.");
		}
		
		if (getIsExecuting()) {
			return;
		}
		isExecuting = true;
		timer.setTimer(this, 11, 250, true);
		
		enterSequence_main_region_default();
		isExecuting = false;
	}
	
	public synchronized void exit() {
		if (getIsExecuting()) {
			return;
		}
		isExecuting = true;
		exitSequence_main_region();
		timer.unsetTimer(this, 11);
		
		isExecuting = false;
	}
	
	public synchronized void runCycle() {
		if (!initialized)
			throw new IllegalStateException(
			        "The state machine needs to be initialized first by calling the init() function.");
		if (timer == null) {
			throw new IllegalStateException("timer not set.");
		}
		
		if (getIsExecuting()) {
			return;
		}
		isExecuting = true;
		swapInEvents();
		for (nextStateIndex = 0; nextStateIndex < stateVector.length; nextStateIndex++) {
			switch (stateVector[nextStateIndex]) {
			case MAIN_REGION_ON_R1_STREETGREEN:
				main_region_on_r1_StreetGreen_react(true);
				break;
			case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
				main_region_on_r1_PedWaiting_r1_waitOn_react(true);
				break;
			case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
				main_region_on_r1_PedWaiting_r1_waitOff_react(true);
				break;
			case MAIN_REGION_ON_R1_STREETATTENTION:
				main_region_on_r1_StreetAttention_react(true);
				break;
			case MAIN_REGION_ON_R1_STREETRED:
				main_region_on_r1_StreetRed_react(true);
				break;
			case MAIN_REGION_ON_R1_PEDESTRIANGREEN:
				main_region_on_r1_PedestrianGreen_react(true);
				break;
			case MAIN_REGION_ON_R1_PEDESTRIANRED:
				main_region_on_r1_PedestrianRed_react(true);
				break;
			case MAIN_REGION_ON_R1_STREETPREPARE:
				main_region_on_r1_StreetPrepare_react(true);
				break;
			case MAIN_REGION_ON_R1_SAFE:
				main_region_on_r1_Safe_react(true);
				break;
			case MAIN_REGION_OFF_R1_YELLOWON:
				main_region_off_r1_YellowOn_react(true);
				break;
			case MAIN_REGION_OFF_R1_YELLOWOFF:
				main_region_off_r1_YellowOff_react(true);
				break;
			default:
				// $NULLSTATE$
			}
		}
		
		isExecuting = false;
	}
	
	/**
	 * @see IStatemachine#isActive()
	 */
	public synchronized boolean isActive() {
		return stateVector[0] != State.$NULLSTATE$;
	}
	
	/** 
	* Always returns 'false' since this state machine can never become final.
	*
	* @see IStatemachine#isFinal()
	*/
	public synchronized boolean isFinal() {
		return false;
	}
	private void swapInEvents() {
		_current.iface.pedestrianRequest = defaultInterface.pedestrianRequest;
		defaultInterface.pedestrianRequest = false;
		
		_current.iface.onOff = defaultInterface.onOff;
		defaultInterface.onOff = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedWaiting_time_event_0 = timeEvents[0];
		timeEvents[0] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedWaiting_r1_waitOn_time_event_0 = timeEvents[1];
		timeEvents[1] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedWaiting_r1_waitOff_time_event_0 = timeEvents[2];
		timeEvents[2] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_on_r1_StreetAttention_time_event_0 = timeEvents[3];
		timeEvents[3] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_on_r1_StreetRed_time_event_0 = timeEvents[4];
		timeEvents[4] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedestrianGreen_time_event_0 = timeEvents[5];
		timeEvents[5] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedestrianRed_time_event_0 = timeEvents[6];
		timeEvents[6] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_on_r1_StreetPrepare_time_event_0 = timeEvents[7];
		timeEvents[7] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_on_r1_Safe_time_event_0 = timeEvents[8];
		timeEvents[8] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_off_r1_YellowOn_time_event_0 = timeEvents[9];
		timeEvents[9] = false;
		
		_current.timeEvents.trafficLightCtrl_main_region_off_r1_YellowOff_time_event_0 = timeEvents[10];
		timeEvents[10] = false;
		
		_current.timeEvents.trafficLightCtrl_time_event_0 = timeEvents[11];
		timeEvents[11] = false;
	}
	
	private void clearInEvents() {
		defaultInterface.pedestrianRequest = false;
		defaultInterface.onOff = false;
		timeEvents[0] = false;
		timeEvents[1] = false;
		timeEvents[2] = false;
		timeEvents[3] = false;
		timeEvents[4] = false;
		timeEvents[5] = false;
		timeEvents[6] = false;
		timeEvents[7] = false;
		timeEvents[8] = false;
		timeEvents[9] = false;
		timeEvents[10] = false;
		timeEvents[11] = false;
	}
	
	/**
	* Returns true if the given state is currently active otherwise false.
	*/
	public synchronized boolean isStateActive(State state) {
	
		switch (state) {
		case MAIN_REGION_ON:
			return stateVector[0].ordinal() >= State.
					MAIN_REGION_ON.ordinal()&& stateVector[0].ordinal() <= State.MAIN_REGION_ON_R1_SAFE.ordinal();
		case MAIN_REGION_ON_R1_STREETGREEN:
			return stateVector[0] == State.MAIN_REGION_ON_R1_STREETGREEN;
		case MAIN_REGION_ON_R1_PEDWAITING:
			return stateVector[0].ordinal() >= State.
					MAIN_REGION_ON_R1_PEDWAITING.ordinal()&& stateVector[0].ordinal() <= State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF.ordinal();
		case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
			return stateVector[0] == State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON;
		case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
			return stateVector[0] == State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF;
		case MAIN_REGION_ON_R1_STREETATTENTION:
			return stateVector[0] == State.MAIN_REGION_ON_R1_STREETATTENTION;
		case MAIN_REGION_ON_R1_STREETRED:
			return stateVector[0] == State.MAIN_REGION_ON_R1_STREETRED;
		case MAIN_REGION_ON_R1_PEDESTRIANGREEN:
			return stateVector[0] == State.MAIN_REGION_ON_R1_PEDESTRIANGREEN;
		case MAIN_REGION_ON_R1_PEDESTRIANRED:
			return stateVector[0] == State.MAIN_REGION_ON_R1_PEDESTRIANRED;
		case MAIN_REGION_ON_R1_STREETPREPARE:
			return stateVector[0] == State.MAIN_REGION_ON_R1_STREETPREPARE;
		case MAIN_REGION_ON_R1_SAFE:
			return stateVector[0] == State.MAIN_REGION_ON_R1_SAFE;
		case MAIN_REGION_OFF:
			return stateVector[0].ordinal() >= State.
					MAIN_REGION_OFF.ordinal()&& stateVector[0].ordinal() <= State.MAIN_REGION_OFF_R1_YELLOWOFF.ordinal();
		case MAIN_REGION_OFF_R1_YELLOWON:
			return stateVector[0] == State.MAIN_REGION_OFF_R1_YELLOWON;
		case MAIN_REGION_OFF_R1_YELLOWOFF:
			return stateVector[0] == State.MAIN_REGION_OFF_R1_YELLOWOFF;
		default:
			return false;
		}
	}
	
	/**
	* Set the {@link ITimer} for the state machine. It must be set
	* externally on a timed state machine before a run cycle can be correctly
	* executed.
	* 
	* @param timer
	*/
	public synchronized void setTimer(ITimer timer) {
		this.timer = timer;
	}
	
	/**
	* Returns the currently used timer.
	* 
	* @return {@link ITimer}
	*/
	public ITimer getTimer() {
		return timer;
	}
	
	public synchronized void timeElapsed(int eventID) {
		timeEvents[eventID] = true;
	}
	
	public InterfaceTrafficLight getInterfaceTrafficLight() {
		return interfaceTrafficLight;
	}
	
	public InterfacePedestrian getInterfacePedestrian() {
		return interfacePedestrian;
	}
	
	public Interface getInterface() {
		return defaultInterface;
	}
	
	public synchronized void raisePedestrianRequest() {
		defaultInterface.raisePedestrianRequest();
	}
	
	public synchronized void raiseOnOff() {
		defaultInterface.raiseOnOff();
	}
	
	/* Entry action for state 'StreetGreen'. */
	private void entryAction_main_region_on_r1_StreetGreen() {
		interfaceTrafficLight.setRed(false);
		
		interfaceTrafficLight.setYellow(false);
		
		interfaceTrafficLight.setGreen(true);
		
		interfacePedestrian.setRed(true);
		
		interfacePedestrian.setGreen(false);
		
		interfacePedestrian.setRequest(false);
	}
	
	/* Entry action for state 'PedWaiting'. */
	private void entryAction_main_region_on_r1_PedWaiting() {
		timer.setTimer(this, 0, (7 * 1000), false);
	}
	
	/* Entry action for state 'waitOn'. */
	private void entryAction_main_region_on_r1_PedWaiting_r1_waitOn() {
		timer.setTimer(this, 1, 500, false);
		
		interfacePedestrian.setRequest(true);
	}
	
	/* Entry action for state 'waitOff'. */
	private void entryAction_main_region_on_r1_PedWaiting_r1_waitOff() {
		timer.setTimer(this, 2, 500, false);
		
		interfacePedestrian.setRequest(false);
	}
	
	/* Entry action for state 'StreetAttention'. */
	private void entryAction_main_region_on_r1_StreetAttention() {
		timer.setTimer(this, 3, (2 * 1000), false);
		
		interfaceTrafficLight.setRed(false);
		
		interfaceTrafficLight.setYellow(true);
		
		interfaceTrafficLight.setGreen(false);
	}
	
	/* Entry action for state 'StreetRed'. */
	private void entryAction_main_region_on_r1_StreetRed() {
		timer.setTimer(this, 4, (2 * 1000), false);
		
		interfaceTrafficLight.setRed(true);
		
		interfaceTrafficLight.setYellow(false);
		
		interfaceTrafficLight.setGreen(false);
	}
	
	/* Entry action for state 'PedestrianGreen'. */
	private void entryAction_main_region_on_r1_PedestrianGreen() {
		timer.setTimer(this, 5, (7 * 1000), false);
		
		interfacePedestrian.setRed(false);
		
		interfacePedestrian.setGreen(true);
	}
	
	/* Entry action for state 'PedestrianRed'. */
	private void entryAction_main_region_on_r1_PedestrianRed() {
		timer.setTimer(this, 6, (5 * 1000), false);
		
		interfacePedestrian.setRed(true);
		
		interfacePedestrian.setGreen(false);
	}
	
	/* Entry action for state 'StreetPrepare'. */
	private void entryAction_main_region_on_r1_StreetPrepare() {
		timer.setTimer(this, 7, (2 * 1000), false);
		
		interfaceTrafficLight.setRed(true);
		
		interfaceTrafficLight.setYellow(true);
		
		interfaceTrafficLight.setGreen(false);
	}
	
	/* Entry action for state 'Safe'. */
	private void entryAction_main_region_on_r1_Safe() {
		timer.setTimer(this, 8, (10 * 1000), false);
		
		interfaceTrafficLight.setRed(true);
		
		interfaceTrafficLight.setYellow(false);
		
		interfaceTrafficLight.setGreen(false);
		
		interfacePedestrian.setRed(true);
		
		interfacePedestrian.setGreen(false);
		
		interfacePedestrian.setRequest(false);
	}
	
	/* Entry action for state 'off'. */
	private void entryAction_main_region_off() {
		interfaceTrafficLight.setRed(false);
		
		interfaceTrafficLight.setGreen(false);
		
		interfaceTrafficLight.setYellow(false);
		
		interfacePedestrian.setRed(false);
		
		interfacePedestrian.setGreen(false);
	}
	
	/* Entry action for state 'YellowOn'. */
	private void entryAction_main_region_off_r1_YellowOn() {
		timer.setTimer(this, 9, 500, false);
		
		interfaceTrafficLight.setYellow(true);
		
		interfacePedestrian.setRequest(true);
	}
	
	/* Entry action for state 'YellowOff'. */
	private void entryAction_main_region_off_r1_YellowOff() {
		timer.setTimer(this, 10, 500, false);
		
		interfaceTrafficLight.setYellow(false);
		
		interfacePedestrian.setRequest(false);
	}
	
	/* Exit action for state 'PedWaiting'. */
	private void exitAction_main_region_on_r1_PedWaiting() {
		timer.unsetTimer(this, 0);
		
		interfacePedestrian.setRequest(false);
	}
	
	/* Exit action for state 'waitOn'. */
	private void exitAction_main_region_on_r1_PedWaiting_r1_waitOn() {
		timer.unsetTimer(this, 1);
	}
	
	/* Exit action for state 'waitOff'. */
	private void exitAction_main_region_on_r1_PedWaiting_r1_waitOff() {
		timer.unsetTimer(this, 2);
	}
	
	/* Exit action for state 'StreetAttention'. */
	private void exitAction_main_region_on_r1_StreetAttention() {
		timer.unsetTimer(this, 3);
	}
	
	/* Exit action for state 'StreetRed'. */
	private void exitAction_main_region_on_r1_StreetRed() {
		timer.unsetTimer(this, 4);
	}
	
	/* Exit action for state 'PedestrianGreen'. */
	private void exitAction_main_region_on_r1_PedestrianGreen() {
		timer.unsetTimer(this, 5);
	}
	
	/* Exit action for state 'PedestrianRed'. */
	private void exitAction_main_region_on_r1_PedestrianRed() {
		timer.unsetTimer(this, 6);
	}
	
	/* Exit action for state 'StreetPrepare'. */
	private void exitAction_main_region_on_r1_StreetPrepare() {
		timer.unsetTimer(this, 7);
	}
	
	/* Exit action for state 'Safe'. */
	private void exitAction_main_region_on_r1_Safe() {
		timer.unsetTimer(this, 8);
	}
	
	/* Exit action for state 'YellowOn'. */
	private void exitAction_main_region_off_r1_YellowOn() {
		timer.unsetTimer(this, 9);
	}
	
	/* Exit action for state 'YellowOff'. */
	private void exitAction_main_region_off_r1_YellowOff() {
		timer.unsetTimer(this, 10);
	}
	
	/* 'default' enter sequence for state on */
	private void enterSequence_main_region_on_default() {
		enterSequence_main_region_on_r1_default();
	}
	
	/* 'default' enter sequence for state StreetGreen */
	private void enterSequence_main_region_on_r1_StreetGreen_default() {
		entryAction_main_region_on_r1_StreetGreen();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_ON_R1_STREETGREEN;
	}
	
	/* 'default' enter sequence for state PedWaiting */
	private void enterSequence_main_region_on_r1_PedWaiting_default() {
		entryAction_main_region_on_r1_PedWaiting();
		enterSequence_main_region_on_r1_PedWaiting_r1_default();
	}
	
	/* 'default' enter sequence for state waitOn */
	private void enterSequence_main_region_on_r1_PedWaiting_r1_waitOn_default() {
		entryAction_main_region_on_r1_PedWaiting_r1_waitOn();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON;
	}
	
	/* 'default' enter sequence for state waitOff */
	private void enterSequence_main_region_on_r1_PedWaiting_r1_waitOff_default() {
		entryAction_main_region_on_r1_PedWaiting_r1_waitOff();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF;
	}
	
	/* 'default' enter sequence for state StreetAttention */
	private void enterSequence_main_region_on_r1_StreetAttention_default() {
		entryAction_main_region_on_r1_StreetAttention();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_ON_R1_STREETATTENTION;
	}
	
	/* 'default' enter sequence for state StreetRed */
	private void enterSequence_main_region_on_r1_StreetRed_default() {
		entryAction_main_region_on_r1_StreetRed();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_ON_R1_STREETRED;
	}
	
	/* 'default' enter sequence for state PedestrianGreen */
	private void enterSequence_main_region_on_r1_PedestrianGreen_default() {
		entryAction_main_region_on_r1_PedestrianGreen();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_ON_R1_PEDESTRIANGREEN;
	}
	
	/* 'default' enter sequence for state PedestrianRed */
	private void enterSequence_main_region_on_r1_PedestrianRed_default() {
		entryAction_main_region_on_r1_PedestrianRed();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_ON_R1_PEDESTRIANRED;
	}
	
	/* 'default' enter sequence for state StreetPrepare */
	private void enterSequence_main_region_on_r1_StreetPrepare_default() {
		entryAction_main_region_on_r1_StreetPrepare();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_ON_R1_STREETPREPARE;
	}
	
	/* 'default' enter sequence for state Safe */
	private void enterSequence_main_region_on_r1_Safe_default() {
		entryAction_main_region_on_r1_Safe();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_ON_R1_SAFE;
	}
	
	/* 'default' enter sequence for state off */
	private void enterSequence_main_region_off_default() {
		entryAction_main_region_off();
		enterSequence_main_region_off_r1_default();
	}
	
	/* 'default' enter sequence for state YellowOn */
	private void enterSequence_main_region_off_r1_YellowOn_default() {
		entryAction_main_region_off_r1_YellowOn();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_OFF_R1_YELLOWON;
	}
	
	/* 'default' enter sequence for state YellowOff */
	private void enterSequence_main_region_off_r1_YellowOff_default() {
		entryAction_main_region_off_r1_YellowOff();
		nextStateIndex = 0;
		stateVector[0] = State.MAIN_REGION_OFF_R1_YELLOWOFF;
	}
	
	/* 'default' enter sequence for region main region */
	private void enterSequence_main_region_default() {
		react_main_region__entry_Default();
	}
	
	/* 'default' enter sequence for region r1 */
	private void enterSequence_main_region_on_r1_default() {
		react_main_region_on_r1__entry_Default();
	}
	
	/* 'default' enter sequence for region r1 */
	private void enterSequence_main_region_on_r1_PedWaiting_r1_default() {
		react_main_region_on_r1_PedWaiting_r1__entry_Default();
	}
	
	/* 'default' enter sequence for region r1 */
	private void enterSequence_main_region_off_r1_default() {
		react_main_region_off_r1__entry_Default();
	}
	
	/* Default exit sequence for state on */
	private void exitSequence_main_region_on() {
		exitSequence_main_region_on_r1();
	}
	
	/* Default exit sequence for state StreetGreen */
	private void exitSequence_main_region_on_r1_StreetGreen() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
	}
	
	/* Default exit sequence for state PedWaiting */
	private void exitSequence_main_region_on_r1_PedWaiting() {
		exitSequence_main_region_on_r1_PedWaiting_r1();
		exitAction_main_region_on_r1_PedWaiting();
	}
	
	/* Default exit sequence for state waitOn */
	private void exitSequence_main_region_on_r1_PedWaiting_r1_waitOn() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_on_r1_PedWaiting_r1_waitOn();
	}
	
	/* Default exit sequence for state waitOff */
	private void exitSequence_main_region_on_r1_PedWaiting_r1_waitOff() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_on_r1_PedWaiting_r1_waitOff();
	}
	
	/* Default exit sequence for state StreetAttention */
	private void exitSequence_main_region_on_r1_StreetAttention() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_on_r1_StreetAttention();
	}
	
	/* Default exit sequence for state StreetRed */
	private void exitSequence_main_region_on_r1_StreetRed() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_on_r1_StreetRed();
	}
	
	/* Default exit sequence for state PedestrianGreen */
	private void exitSequence_main_region_on_r1_PedestrianGreen() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_on_r1_PedestrianGreen();
	}
	
	/* Default exit sequence for state PedestrianRed */
	private void exitSequence_main_region_on_r1_PedestrianRed() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_on_r1_PedestrianRed();
	}
	
	/* Default exit sequence for state StreetPrepare */
	private void exitSequence_main_region_on_r1_StreetPrepare() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_on_r1_StreetPrepare();
	}
	
	/* Default exit sequence for state Safe */
	private void exitSequence_main_region_on_r1_Safe() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_on_r1_Safe();
	}
	
	/* Default exit sequence for state off */
	private void exitSequence_main_region_off() {
		exitSequence_main_region_off_r1();
	}
	
	/* Default exit sequence for state YellowOn */
	private void exitSequence_main_region_off_r1_YellowOn() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_off_r1_YellowOn();
	}
	
	/* Default exit sequence for state YellowOff */
	private void exitSequence_main_region_off_r1_YellowOff() {
		nextStateIndex = 0;
		stateVector[0] = State.$NULLSTATE$;
		
		exitAction_main_region_off_r1_YellowOff();
	}
	
	/* Default exit sequence for region main region */
	private void exitSequence_main_region() {
		switch (stateVector[0]) {
		case MAIN_REGION_ON_R1_STREETGREEN:
			exitSequence_main_region_on_r1_StreetGreen();
			break;
		case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
			exitSequence_main_region_on_r1_PedWaiting_r1_waitOn();
			exitAction_main_region_on_r1_PedWaiting();
			break;
		case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
			exitSequence_main_region_on_r1_PedWaiting_r1_waitOff();
			exitAction_main_region_on_r1_PedWaiting();
			break;
		case MAIN_REGION_ON_R1_STREETATTENTION:
			exitSequence_main_region_on_r1_StreetAttention();
			break;
		case MAIN_REGION_ON_R1_STREETRED:
			exitSequence_main_region_on_r1_StreetRed();
			break;
		case MAIN_REGION_ON_R1_PEDESTRIANGREEN:
			exitSequence_main_region_on_r1_PedestrianGreen();
			break;
		case MAIN_REGION_ON_R1_PEDESTRIANRED:
			exitSequence_main_region_on_r1_PedestrianRed();
			break;
		case MAIN_REGION_ON_R1_STREETPREPARE:
			exitSequence_main_region_on_r1_StreetPrepare();
			break;
		case MAIN_REGION_ON_R1_SAFE:
			exitSequence_main_region_on_r1_Safe();
			break;
		case MAIN_REGION_OFF_R1_YELLOWON:
			exitSequence_main_region_off_r1_YellowOn();
			break;
		case MAIN_REGION_OFF_R1_YELLOWOFF:
			exitSequence_main_region_off_r1_YellowOff();
			break;
		default:
			break;
		}
	}
	
	/* Default exit sequence for region r1 */
	private void exitSequence_main_region_on_r1() {
		switch (stateVector[0]) {
		case MAIN_REGION_ON_R1_STREETGREEN:
			exitSequence_main_region_on_r1_StreetGreen();
			break;
		case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
			exitSequence_main_region_on_r1_PedWaiting_r1_waitOn();
			exitAction_main_region_on_r1_PedWaiting();
			break;
		case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
			exitSequence_main_region_on_r1_PedWaiting_r1_waitOff();
			exitAction_main_region_on_r1_PedWaiting();
			break;
		case MAIN_REGION_ON_R1_STREETATTENTION:
			exitSequence_main_region_on_r1_StreetAttention();
			break;
		case MAIN_REGION_ON_R1_STREETRED:
			exitSequence_main_region_on_r1_StreetRed();
			break;
		case MAIN_REGION_ON_R1_PEDESTRIANGREEN:
			exitSequence_main_region_on_r1_PedestrianGreen();
			break;
		case MAIN_REGION_ON_R1_PEDESTRIANRED:
			exitSequence_main_region_on_r1_PedestrianRed();
			break;
		case MAIN_REGION_ON_R1_STREETPREPARE:
			exitSequence_main_region_on_r1_StreetPrepare();
			break;
		case MAIN_REGION_ON_R1_SAFE:
			exitSequence_main_region_on_r1_Safe();
			break;
		default:
			break;
		}
	}
	
	/* Default exit sequence for region r1 */
	private void exitSequence_main_region_on_r1_PedWaiting_r1() {
		switch (stateVector[0]) {
		case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
			exitSequence_main_region_on_r1_PedWaiting_r1_waitOn();
			break;
		case MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
			exitSequence_main_region_on_r1_PedWaiting_r1_waitOff();
			break;
		default:
			break;
		}
	}
	
	/* Default exit sequence for region r1 */
	private void exitSequence_main_region_off_r1() {
		switch (stateVector[0]) {
		case MAIN_REGION_OFF_R1_YELLOWON:
			exitSequence_main_region_off_r1_YellowOn();
			break;
		case MAIN_REGION_OFF_R1_YELLOWOFF:
			exitSequence_main_region_off_r1_YellowOff();
			break;
		default:
			break;
		}
	}
	
	/* Default react sequence for initial entry  */
	private void react_main_region__entry_Default() {
		enterSequence_main_region_off_default();
	}
	
	/* Default react sequence for initial entry  */
	private void react_main_region_on_r1_PedWaiting_r1__entry_Default() {
		enterSequence_main_region_on_r1_PedWaiting_r1_waitOn_default();
	}
	
	/* Default react sequence for initial entry  */
	private void react_main_region_on_r1__entry_Default() {
		enterSequence_main_region_on_r1_Safe_default();
	}
	
	/* Default react sequence for initial entry  */
	private void react_main_region_off_r1__entry_Default() {
		enterSequence_main_region_off_r1_YellowOn_default();
	}
	
	private boolean react() {
		if (_current.timeEvents.trafficLightCtrl_time_event_0) {
			defaultInterface.operationCallback.synchronize();
		}
		return false;
	}
	
	private boolean main_region_on_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (react()==false) {
				if (_current.iface.onOff) {
					exitSequence_main_region_on();
					enterSequence_main_region_off_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_StreetGreen_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_react(try_transition)==false) {
				if (_current.iface.pedestrianRequest) {
					exitSequence_main_region_on_r1_StreetGreen();
					enterSequence_main_region_on_r1_PedWaiting_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_PedWaiting_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedWaiting_time_event_0) {
					exitSequence_main_region_on_r1_PedWaiting();
					enterSequence_main_region_on_r1_StreetAttention_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_PedWaiting_r1_waitOn_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_r1_PedWaiting_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedWaiting_r1_waitOn_time_event_0) {
					exitSequence_main_region_on_r1_PedWaiting_r1_waitOn();
					enterSequence_main_region_on_r1_PedWaiting_r1_waitOff_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_PedWaiting_r1_waitOff_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_r1_PedWaiting_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedWaiting_r1_waitOff_time_event_0) {
					exitSequence_main_region_on_r1_PedWaiting_r1_waitOff();
					enterSequence_main_region_on_r1_PedWaiting_r1_waitOn_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_StreetAttention_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_on_r1_StreetAttention_time_event_0) {
					exitSequence_main_region_on_r1_StreetAttention();
					enterSequence_main_region_on_r1_StreetRed_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_StreetRed_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_on_r1_StreetRed_time_event_0) {
					exitSequence_main_region_on_r1_StreetRed();
					enterSequence_main_region_on_r1_PedestrianGreen_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_PedestrianGreen_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedestrianGreen_time_event_0) {
					exitSequence_main_region_on_r1_PedestrianGreen();
					enterSequence_main_region_on_r1_PedestrianRed_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_PedestrianRed_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_on_r1_PedestrianRed_time_event_0) {
					exitSequence_main_region_on_r1_PedestrianRed();
					enterSequence_main_region_on_r1_StreetPrepare_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_StreetPrepare_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_on_r1_StreetPrepare_time_event_0) {
					exitSequence_main_region_on_r1_StreetPrepare();
					enterSequence_main_region_on_r1_StreetGreen_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_on_r1_Safe_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_on_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_on_r1_Safe_time_event_0) {
					exitSequence_main_region_on_r1_Safe();
					enterSequence_main_region_on_r1_StreetPrepare_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_off_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (react()==false) {
				if (_current.iface.onOff) {
					exitSequence_main_region_off();
					enterSequence_main_region_on_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_off_r1_YellowOn_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_off_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_off_r1_YellowOn_time_event_0) {
					exitSequence_main_region_off_r1_YellowOn();
					enterSequence_main_region_off_r1_YellowOff_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
	private boolean main_region_off_r1_YellowOff_react(boolean try_transition) {
		boolean did_transition = try_transition;
		
		if (try_transition) {
			if (main_region_off_react(try_transition)==false) {
				if (_current.timeEvents.trafficLightCtrl_main_region_off_r1_YellowOff_time_event_0) {
					exitSequence_main_region_off_r1_YellowOff();
					enterSequence_main_region_off_r1_YellowOn_default();
				} else {
					did_transition = false;
				}
			}
		}
		return did_transition;
	}
	
}
