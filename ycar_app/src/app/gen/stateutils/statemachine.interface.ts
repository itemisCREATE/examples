
/**
 * Basic interface for state machines. TEMPLATE BASED
 */
export interface IStatemachine {

	/**
	 * Initializes the state machine. Used to initialize internal variables etc.
	 */
	 init():void;

	/**
	 * Enters the state machine. Sets the state machine into a defined state.
	 */
	enter():void;

	/**
	 * Exits the state machine. Leaves the state machine with a defined state.
	 */
	 exit():void;

	/**
	 * Checks whether the state machine is active. 
	 * A state machine is active if it has been entered. It is inactive if it has not been entered at all or if it has been exited.
	 */
	  isActive():boolean;

	/**
	 * Checks whether all active states are final. 
	 * If there are no active states then the state machine is considered being incative. In this case this method returns <code>false</code>.
	 */
	  isFinal():boolean;

	/**
	* Start a run-to-completion cycle.
	*/
	  runCycle():void;
}

