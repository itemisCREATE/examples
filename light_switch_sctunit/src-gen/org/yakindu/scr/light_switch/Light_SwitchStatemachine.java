package org.yakindu.scr.light_switch;

public class Light_SwitchStatemachine implements ILight_SwitchStatemachine {

	protected class SCInterfaceImpl implements SCInterface {
	
		private boolean operate;
		
		public void raiseOperate() {
			operate = true;
		}
		
		protected void clearEvents() {
			operate = false;
		}
	}
	
	protected SCInterfaceImpl sCInterface;
	
	private boolean initialized = false;
	
	public enum State {
		main_region_Off,
		main_region_On,
		$NullState$
	};
	
	private final State[] stateVector = new State[1];
	
	private int nextStateIndex;
	
	public Light_SwitchStatemachine() {
		sCInterface = new SCInterfaceImpl();
	}
	
	public void init() {
		this.initialized = true;
		for (int i = 0; i < 1; i++) {
			stateVector[i] = State.$NullState$;
		}
		clearEvents();
		clearOutEvents();
	}
	
	public void enter() {
		if (!initialized) {
			throw new IllegalStateException(
					"The state machine needs to be initialized first by calling the init() function.");
		}
		enterSequence_main_region_default();
	}
	
	public void exit() {
		exitSequence_main_region();
	}
	
	/**
	 * @see IStatemachine#isActive()
	 */
	public boolean isActive() {
		return stateVector[0] != State.$NullState$;
	}
	
	/** 
	* Always returns 'false' since this state machine can never become final.
	*
	* @see IStatemachine#isFinal()
	*/
	public boolean isFinal() {
		return false;
	}
	/**
	* This method resets the incoming events (time events included).
	*/
	protected void clearEvents() {
		sCInterface.clearEvents();
	}
	
	/**
	* This method resets the outgoing events.
	*/
	protected void clearOutEvents() {
	}
	
	/**
	* Returns true if the given state is currently active otherwise false.
	*/
	public boolean isStateActive(State state) {
	
		switch (state) {
		case main_region_Off:
			return stateVector[0] == State.main_region_Off;
		case main_region_On:
			return stateVector[0] == State.main_region_On;
		default:
			return false;
		}
	}
	
	public SCInterface getSCInterface() {
		return sCInterface;
	}
	
	public void raiseOperate() {
		sCInterface.raiseOperate();
	}
	
	private boolean check_main_region_Off_tr0_tr0() {
		return sCInterface.operate;
	}
	
	private boolean check_main_region_On_tr0_tr0() {
		return sCInterface.operate;
	}
	
	private void effect_main_region_Off_tr0() {
		exitSequence_main_region_Off();
		enterSequence_main_region_On_default();
	}
	
	private void effect_main_region_On_tr0() {
		exitSequence_main_region_On();
		enterSequence_main_region_Off_default();
	}
	
	/* 'default' enter sequence for state Off */
	private void enterSequence_main_region_Off_default() {
		nextStateIndex = 0;
		stateVector[0] = State.main_region_Off;
	}
	
	/* 'default' enter sequence for state On */
	private void enterSequence_main_region_On_default() {
		nextStateIndex = 0;
		stateVector[0] = State.main_region_On;
	}
	
	/* 'default' enter sequence for region main region */
	private void enterSequence_main_region_default() {
		react_main_region__entry_Default();
	}
	
	/* Default exit sequence for state Off */
	private void exitSequence_main_region_Off() {
		nextStateIndex = 0;
		stateVector[0] = State.$NullState$;
	}
	
	/* Default exit sequence for state On */
	private void exitSequence_main_region_On() {
		nextStateIndex = 0;
		stateVector[0] = State.$NullState$;
	}
	
	/* Default exit sequence for region main region */
	private void exitSequence_main_region() {
		switch (stateVector[0]) {
		case main_region_Off:
			exitSequence_main_region_Off();
			break;
		case main_region_On:
			exitSequence_main_region_On();
			break;
		default:
			break;
		}
	}
	
	/* The reactions of state Off. */
	private void react_main_region_Off() {
		if (check_main_region_Off_tr0_tr0()) {
			effect_main_region_Off_tr0();
		}
	}
	
	/* The reactions of state On. */
	private void react_main_region_On() {
		if (check_main_region_On_tr0_tr0()) {
			effect_main_region_On_tr0();
		}
	}
	
	/* Default react sequence for initial entry  */
	private void react_main_region__entry_Default() {
		enterSequence_main_region_Off_default();
	}
	
	public void runCycle() {
		if (!initialized)
			throw new IllegalStateException(
					"The state machine needs to be initialized first by calling the init() function.");
		clearOutEvents();
		for (nextStateIndex = 0; nextStateIndex < stateVector.length; nextStateIndex++) {
			switch (stateVector[nextStateIndex]) {
			case main_region_Off:
				react_main_region_Off();
				break;
			case main_region_On:
				react_main_region_On();
				break;
			default:
				// $NullState$
			}
		}
		clearEvents();
	}
}
