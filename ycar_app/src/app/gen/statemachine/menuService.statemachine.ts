import {Injectable} from '@angular/core';
import {EventQueue, Event} from '../stateutils/eventQueue';
import {IStatemachine} from '../stateutils/statemachine.interface';
import {StatemachineEventHandlerService} from '../stateutils/statemachineEventHandler.service';
import {Subject, Subscription} from 'rxjs';


@Injectable()
export class MenuService implements IStatemachine {
	
	// state machine members
	protected  timeEvents:any[] = new Array<any>(1);
	
	protected initialized:boolean = false;
	
	protected stateVector:State[] = new Array<State>(1);
	
	protected  nextStateIndex:number;
	
	// member for each interface scope
	public readonly defaultScope:SCIDefault = new SCIDefault();
	// members of internal scope
	
	
	// members for default scope access
	public get menuState():string {
		return this.defaultScope.menuState;
	}
	
	public set menuState(value:string) { 
		this.defaultScope.menuState=value;
	}
	
	
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
			this.defaultScope.onMenuChanged$.subscribe(() => {
				this.eventQueue.trigger(new Event(this, 'onMenuChanged', null));
			});
		
		
		// OUT EVENT SUBSCRIPTIONS
	
		this.defaultScope.menuState='';
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
			case State.main_region_menu:
				this.react_main_region_menu();
				break;
			case State.main_region_waiting_for_user_interaction:
				this.react_main_region_waiting_for_user_interaction();
				break;
			case State.main_region_weather:
				this.react_main_region_weather();
				break;
			case State.main_region_music:
				this.react_main_region_music();
				break;
			case State.main_region_phone:
				this.react_main_region_phone();
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
			case State.main_region_menu: 
				return this.stateVector[0] === State.main_region_menu
				;
			case State.main_region_waiting_for_user_interaction: 
				return this.stateVector[0] === State.main_region_waiting_for_user_interaction
				;
			case State.main_region_weather: 
				return this.stateVector[0] === State.main_region_weather
				;
			case State.main_region_music: 
				return this.stateVector[0] === State.main_region_music
				;
			case State.main_region_phone: 
				return this.stateVector[0] === State.main_region_phone
				;
			default: return false;
		}
	}
	
	
	
	public raiseOnMenuChanged():void {
		this.defaultScope.raiseOnMenuChanged();
	}
	
	 public getOnMenuChanged():Subject<any> {
		return this.defaultScope.onMenuChanged$;
	 }
	
	public subscribeOnMenuChanged(ev:any): Subscription {
	 	return this.defaultScope.subscribeOnMenuChanged(ev);
	}
	
	private  check_main_region_menu_tr0_tr0():boolean {
		return this.eventQueue.head.source === this && this.eventQueue.head.identifier ===  "time_event_0";
	}
	private  check_main_region_waiting_for_user_interaction_tr0_tr0():boolean {
		return this.eventQueue.head.source === this && this.eventQueue.head.identifier ===  "onMenuChanged";
	}
	private  check_main_region_weather_tr0_tr0():boolean {
		return this.eventQueue.head.source === this && this.eventQueue.head.identifier ===  "onMenuChanged";
	}
	private  check_main_region_music_tr0_tr0():boolean {
		return this.eventQueue.head.source === this && this.eventQueue.head.identifier ===  "onMenuChanged";
	}
	private  check_main_region_phone_tr0_tr0():boolean {
		return this.eventQueue.head.source === this && this.eventQueue.head.identifier ===  "onMenuChanged";
	}
	private  check_main_region__choice_0_tr0_tr0():boolean {
		return this.defaultScope.menuState==='music';
	}
	private  check_main_region__choice_0_tr1_tr1():boolean {
		return this.defaultScope.menuState==='phone';
	}
	private  check_main_region__choice_0_tr3_tr3():boolean {
		return this.defaultScope.menuState==='weather';
	}
	private  check_main_region__choice_0_tr2_tr2():boolean {
		return true;
	}
	private  effect_main_region_menu_tr0():void {
		this.exitSequence_main_region_menu();
		this.enterSequence_main_region_waiting_for_user_interaction_default(); 
	}
	private  effect_main_region_waiting_for_user_interaction_tr0():void {
		this.exitSequence_main_region_waiting_for_user_interaction();
		this.react_main_region__choice_0(); 
	}
	private  effect_main_region_weather_tr0():void {
		this.exitSequence_main_region_weather();
		this.react_main_region__choice_0(); 
	}
	private  effect_main_region_music_tr0():void {
		this.exitSequence_main_region_music();
		this.react_main_region__choice_0(); 
	}
	private  effect_main_region_phone_tr0():void {
		this.exitSequence_main_region_phone();
		this.react_main_region__choice_0(); 
	}
	private  effect_main_region__choice_0_tr0():void {
		this.enterSequence_main_region_music_default(); 
	}
	private  effect_main_region__choice_0_tr1():void {
		this.enterSequence_main_region_phone_default(); 
	}
	private  effect_main_region__choice_0_tr3():void {
		this.enterSequence_main_region_weather_default(); 
	}
	private  effect_main_region__choice_0_tr2():void {
		this.enterSequence_main_region_menu_default(); 
	}
	/* Entry action for state 'menu'. */
	private  entryAction_main_region_menu():void {
		this.timeEvents[0] = setTimeout(() => {
			this.eventQueue.trigger(new Event(this, 'time_event_0', null));
		}, 500);	
		
		this.defaultScope.operationCallback.showMenuScreen() ; 
	}
	/* Entry action for state 'weather'. */
	private  entryAction_main_region_weather():void {
		this.defaultScope.operationCallback.showWeatherScreen() ; 
	}
	/* Entry action for state 'music'. */
	private  entryAction_main_region_music():void {
		this.defaultScope.operationCallback.showMusicScreen() ; 
	}
	/* Entry action for state 'phone'. */
	private  entryAction_main_region_phone():void {
		this.defaultScope.operationCallback.showPhoneScreen() ; 
	}
	/* Exit action for state 'menu'. */
	private  exitAction_main_region_menu():void {
		clearInterval(this.timeEvents[0]); 
	}
	/* 'default' enter sequence for state menu */
	private  enterSequence_main_region_menu_default():void {
		this.entryAction_main_region_menu();
		this.nextStateIndex = 0;
		this.stateVector[0] = State.main_region_menu;
	}
	/* 'default' enter sequence for state waiting for user interaction */
	private  enterSequence_main_region_waiting_for_user_interaction_default():void {
		this.nextStateIndex = 0;
		this.stateVector[0] = State.main_region_waiting_for_user_interaction;
	}
	/* 'default' enter sequence for state weather */
	private  enterSequence_main_region_weather_default():void {
		this.entryAction_main_region_weather();
		this.nextStateIndex = 0;
		this.stateVector[0] = State.main_region_weather;
	}
	/* 'default' enter sequence for state music */
	private  enterSequence_main_region_music_default():void {
		this.entryAction_main_region_music();
		this.nextStateIndex = 0;
		this.stateVector[0] = State.main_region_music;
	}
	/* 'default' enter sequence for state phone */
	private  enterSequence_main_region_phone_default():void {
		this.entryAction_main_region_phone();
		this.nextStateIndex = 0;
		this.stateVector[0] = State.main_region_phone;
	}
	/* 'default' enter sequence for region main region */
	private  enterSequence_main_region_default():void {
		this.react_main_region__entry_Default(); 
	}
	/* Default exit sequence for state menu */
	private  exitSequence_main_region_menu():void {
		this.nextStateIndex = 0;
		this.stateVector[0] = State.NullState;
		
		this.exitAction_main_region_menu(); 
	}
	/* Default exit sequence for state waiting for user interaction */
	private  exitSequence_main_region_waiting_for_user_interaction():void {
		this.nextStateIndex = 0;
		this.stateVector[0] = State.NullState;
	}
	/* Default exit sequence for state weather */
	private  exitSequence_main_region_weather():void {
		this.nextStateIndex = 0;
		this.stateVector[0] = State.NullState;
	}
	/* Default exit sequence for state music */
	private  exitSequence_main_region_music():void {
		this.nextStateIndex = 0;
		this.stateVector[0] = State.NullState;
	}
	/* Default exit sequence for state phone */
	private  exitSequence_main_region_phone():void {
		this.nextStateIndex = 0;
		this.stateVector[0] = State.NullState;
	}
	/* Default exit sequence for region main region */
	private  exitSequence_main_region():void {
		switch(this.stateVector[0]) {
			case State.main_region_menu : 
				this.exitSequence_main_region_menu();
				break;
			
			case State.main_region_waiting_for_user_interaction : 
				this.exitSequence_main_region_waiting_for_user_interaction();
				break;
			
			case State.main_region_weather : 
				this.exitSequence_main_region_weather();
				break;
			
			case State.main_region_music : 
				this.exitSequence_main_region_music();
				break;
			
			case State.main_region_phone : 
				this.exitSequence_main_region_phone();
				break;
			
			default: 
				break;
		}
	}
	/* The reactions of state menu. */
	private  react_main_region_menu():void {
		if (this.check_main_region_menu_tr0_tr0()
		) { 
			this.effect_main_region_menu_tr0();
		}  
	}
	/* The reactions of state waiting for user interaction. */
	private  react_main_region_waiting_for_user_interaction():void {
		if (this.check_main_region_waiting_for_user_interaction_tr0_tr0()
		) { 
			this.effect_main_region_waiting_for_user_interaction_tr0();
		}  
	}
	/* The reactions of state weather. */
	private  react_main_region_weather():void {
		if (this.check_main_region_weather_tr0_tr0()
		) { 
			this.effect_main_region_weather_tr0();
		}  
	}
	/* The reactions of state music. */
	private  react_main_region_music():void {
		if (this.check_main_region_music_tr0_tr0()
		) { 
			this.effect_main_region_music_tr0();
		}  
	}
	/* The reactions of state phone. */
	private  react_main_region_phone():void {
		if (this.check_main_region_phone_tr0_tr0()
		) { 
			this.effect_main_region_phone_tr0();
		}  
	}
	/* The reactions of state null. */
	private  react_main_region__choice_0():void {
		if (this.check_main_region__choice_0_tr0_tr0()
		) { 
			this.effect_main_region__choice_0_tr0();
		} else {
			if (this.check_main_region__choice_0_tr1_tr1()
			) { 
				this.effect_main_region__choice_0_tr1();
			} else {
				if (this.check_main_region__choice_0_tr3_tr3()
				) { 
					this.effect_main_region__choice_0_tr3();
				} else {
					this.effect_main_region__choice_0_tr2();
					}
				}
			}
	}
	/* Default react sequence for initial entry  */
	private  react_main_region__entry_Default():void {
		this.enterSequence_main_region_menu_default(); 
	}
	
}

export class SCIDefault {

	public operationCallback: IOperationCallback;
	
	setdefaultScopeOperationCallback(operationCallback: IOperationCallback):void {
		this.operationCallback = operationCallback;
	}

	//onMenuChanged:boolean;
	public onMenuChanged$: Subject<any> = new Subject<any>();
	
	
	public raiseOnMenuChanged():void {
		//this.onMenuChanged = true;
		this.onMenuChanged$.next();
	}
	
	public subscribeOnMenuChanged(ev:any): Subscription {
		return ev.subscribe(() => {
			this.raiseOnMenuChanged();
		});
	}
	
	

	public _menuState:string;
	
	get menuState():string {
		return this._menuState;
	} 
	set menuState(value:string) {
		this._menuState = value;
	}

	clearEvents():void {
	//this.onMenuChanged = false;
	}

 }
export interface IOperationCallback {
	showMenuScreen?();
	showWeatherScreen?();
	showMusicScreen?();
	showPhoneScreen?();
	waitingMessage?();
}

export enum State {
	main_region_menu,
	main_region_waiting_for_user_interaction,
	main_region_weather,
	main_region_music,
	main_region_phone,
	NullState
}
