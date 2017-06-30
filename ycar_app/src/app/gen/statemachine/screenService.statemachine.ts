import {Injectable} from '@angular/core';
import {EventQueue, Event} from '../stateutils/eventQueue';
import {IStatemachine} from '../stateutils/statemachine.interface';
import {StatemachineEventHandlerService} from '../stateutils/statemachineEventHandler.service';
import {Subject, Subscription} from 'rxjs';


@Injectable()
export class ScreenService implements IStatemachine {
	
	// state machine members
	
	protected initialized:boolean = false;
	
	protected stateVector:State[] = new Array<State>(1);
	
	protected  nextStateIndex:number;
	
	// member for each interface scope
	public readonly defaultScope:SCIDefault = new SCIDefault();
	// members of internal scope
	
	
	// members for default scope access
	
	private eventQueue:EventQueue = new EventQueue();
	
	
	constructor(public statemachineEventHandlerService: StatemachineEventHandlerService) {
		this.statemachineEventHandlerService.onCall.subscribe(e => {
			this.scEventHandler(e);
		});
	}
	
	scEventHandler(event:Event) {
	}
	
	public init():void {
		for (let i = 0; i < 1; i++) {
			this.stateVector[i] = State.NullState;
		}
	
	
		this.clearEvents();
		this.clearOutEvents();
		
		this.eventQueue.onProcess.subscribe((id)=> {
			this.runCycle();
		});	
	
	
		// IN EVENT SUBSCRIPTIONS
			this.defaultScope.onTurnOff$.subscribe(() => {
				this.eventQueue.trigger(new Event(this, 'onTurnOff', null));
			});
			this.defaultScope.onTurnOn$.subscribe(() => {
				this.eventQueue.trigger(new Event(this, 'onTurnOn', null));
			});
		
		
		// OUT EVENT SUBSCRIPTIONS
	
		this.initialized = true;
		}
	
	enter():void {
		 if (!this.initialized) {
			throw 'statemachine is not initialized!';
		 }
		this.enterSequence_main_region_default();
	}
	
	exit():void {
		this.exitSequence_main_region();
	}
	
	runCycle():void {
		this.clearOutEvents();
		
		for (this.nextStateIndex = 0; this.nextStateIndex < this.stateVector.length; this.nextStateIndex++) {
			switch (this.stateVector[this.nextStateIndex]) {
			case State.main_region_off:
				this.react_main_region_off();
				break;
			case State.main_region_on:
				this.react_main_region_on();
				break;
			default:
				// NullState
				break;
			}
		}
		this.clearEvents();
	}
	
	/**
	 * @see IStatemachine#isActive()
	 */
	public isActive():boolean {
	 	return this.stateVector[0] !== State.NullState;
	}
	
	/** 
	* Always returns 'false' since this state machine can never become final.
	*
	 * @see IStatemachine#isFinal() 
	 */
	public isFinal():boolean {
		return false;
	}
	
	/**
	* This method resets the incoming events (time events included).
	*/
	protected  clearEvents():void {
		//this.eventQueue.queue = [];
		
	
		this.defaultScope.clearEvents();
	}
	
	/**
	* This method resets the outgoing events.
	*/
	protected clearOutEvents():void {
	}
	
	/**
	* Returns true if the given state is currently active otherwise false.
	*/
	public  isStateActive(state:State):boolean {
		switch (state) {
			case State.main_region_off: 
				return this.stateVector[0] === State.main_region_off
				;
			case State.main_region_on: 
				return this.stateVector[0] === State.main_region_on
				;
			default: return false;
		}
	}
	
	
	
	public raiseOnTurnOff():void {
		this.defaultScope.raiseOnTurnOff();
	}
	
	 public getOnTurnOff():Subject<any> {
		return this.defaultScope.onTurnOff$;
	 }
	
	public subscribeOnTurnOff(ev:any): Subscription {
	 	return this.defaultScope.subscribeOnTurnOff(ev);
	}
	public raiseOnTurnOn():void {
		this.defaultScope.raiseOnTurnOn();
	}
	
	 public getOnTurnOn():Subject<any> {
		return this.defaultScope.onTurnOn$;
	 }
	
	public subscribeOnTurnOn(ev:any): Subscription {
	 	return this.defaultScope.subscribeOnTurnOn(ev);
	}
	
	private  check_main_region_off_tr0_tr0():boolean {
		return this.eventQueue.head.source === this && this.eventQueue.head.identifier ===  "onTurnOn";
	}
	private  check_main_region_on_tr0_tr0():boolean {
		return this.eventQueue.head.source === this && this.eventQueue.head.identifier ===  "onTurnOff";
	}
	private  effect_main_region_off_tr0():void {
		this.exitSequence_main_region_off();
		this.enterSequence_main_region_on_default(); 
	}
	private  effect_main_region_on_tr0():void {
		this.exitSequence_main_region_on();
		this.enterSequence_main_region_off_default(); 
	}
	/* Entry action for state 'off'. */
	private  entryAction_main_region_off():void {
		this.defaultScope.operationCallback.navigateToWelcomeScreen() ; 
	}
	/* Entry action for state 'on'. */
	private  entryAction_main_region_on():void {
		this.defaultScope.operationCallback.navigateToMainScreen() ; 
	}
	/* 'default' enter sequence for state off */
	private  enterSequence_main_region_off_default():void {
		this.entryAction_main_region_off();
		this.nextStateIndex = 0;
		this.stateVector[0] = State.main_region_off;
	}
	/* 'default' enter sequence for state on */
	private  enterSequence_main_region_on_default():void {
		this.entryAction_main_region_on();
		this.nextStateIndex = 0;
		this.stateVector[0] = State.main_region_on;
	}
	/* 'default' enter sequence for region main region */
	private  enterSequence_main_region_default():void {
		this.react_main_region__entry_Default(); 
	}
	/* Default exit sequence for state off */
	private  exitSequence_main_region_off():void {
		this.nextStateIndex = 0;
		this.stateVector[0] = State.NullState;
	}
	/* Default exit sequence for state on */
	private  exitSequence_main_region_on():void {
		this.nextStateIndex = 0;
		this.stateVector[0] = State.NullState;
	}
	/* Default exit sequence for region main region */
	private  exitSequence_main_region():void {
		switch(this.stateVector[0]) {
			case State.main_region_off : 
				this.exitSequence_main_region_off();
				break;
			
			case State.main_region_on : 
				this.exitSequence_main_region_on();
				break;
			
			default: 
				break;
		}
	}
	/* The reactions of state off. */
	private  react_main_region_off():void {
		if (this.check_main_region_off_tr0_tr0()
		) { 
			this.effect_main_region_off_tr0();
		}  
	}
	/* The reactions of state on. */
	private  react_main_region_on():void {
		if (this.check_main_region_on_tr0_tr0()
		) { 
			this.effect_main_region_on_tr0();
		}  
	}
	/* Default react sequence for initial entry  */
	private  react_main_region__entry_Default():void {
		this.enterSequence_main_region_off_default(); 
	}
	
}

export class SCIDefault {

	public operationCallback: IOperationCallback;
	
	setdefaultScopeOperationCallback(operationCallback: IOperationCallback):void {
		this.operationCallback = operationCallback;
	}

	//onTurnOff:boolean;
	public onTurnOff$: Subject<any> = new Subject<any>();
	
	
	public raiseOnTurnOff():void {
		//this.onTurnOff = true;
		this.onTurnOff$.next();
	}
	
	public subscribeOnTurnOff(ev:any): Subscription {
		return ev.subscribe(() => {
			this.raiseOnTurnOff();
		});
	}
	
	
	
	//onTurnOn:boolean;
	public onTurnOn$: Subject<any> = new Subject<any>();
	
	
	public raiseOnTurnOn():void {
		//this.onTurnOn = true;
		this.onTurnOn$.next();
	}
	
	public subscribeOnTurnOn(ev:any): Subscription {
		return ev.subscribe(() => {
			this.raiseOnTurnOn();
		});
	}
	
	


	clearEvents():void {
	//this.onTurnOff = false;
	//this.onTurnOn = false;
	}

 }
export interface IOperationCallback {
	navigateToWelcomeScreen?();
	navigateToMainScreen?();
}

export enum State {
	main_region_off,
	main_region_on,
	NullState
}
