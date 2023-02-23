import { createMachine, Machine, State, actions, assign, send, sendParent, interpret, spawn, EventObject, DoneInvokeEvent} from 'xstate';
import { Subject } from 'rxjs';
const {choose} = actions;

export class StatechartContext {
	//Internal
	
	//Default Interface
	Pedestrian_request : boolean = false;
	
	//Interfaces
	TrafficLight : TrafficLight = new TrafficLight();
	Pedestrian : Pedestrian = new Pedestrian();
	
	//Constructor
	constructor(){
	}
}

export class TrafficLight {
		off$ = new Subject<void>();
		red$ = new Subject<void>();
		preparing$ = new Subject<void>();
		yellow$ = new Subject<void>();
		green$ = new Subject<void>();
};
export class Pedestrian {
		off$ = new Subject<void>();
		red$ = new Subject<void>();
		green$ = new Subject<void>();
}
;


type Event = DoneInvokeEvent<any>;

export const TrafficLightCtrl = createMachine<StatechartContext, Event>(
	{
		// Always call an action with the event directly responsible for the related transition
		// Call actions in order instead of prioritizing
		predictableActionArguments: true,
		
		// Machine identifier
		id: 'TrafficLightCtrl',
		
		// Type declarations for the context
		schema: {
			context: {} as StatechartContext
		},
		
		// Initial state
		initial: 'main_region',
		states: {
			main_region: {
				// Initial state
				initial: 'off',
				
				// State definitions
				states: {
					on: {
						type: 'compound',
						on: {
							onOff: {
								target: '#TrafficLightCtrl.main_region.off'
							},
									
						},
						initial: 'r1',
						states: {
							r1: {
								// Initial state
								initial: 'Safe',
								
								// State definitions
								states: {
									StreetGreen: {
										type: 'atomic',
										entry: choose([
											{
												actions: [
													(context : StatechartContext, event) => context.TrafficLight.green$.next(),
												
													(context : StatechartContext, event) => context.Pedestrian.red$.next()
												]
											}
										]),
										on: {
											pedestrianRequest: {
												target: '#TrafficLightCtrl.main_region.on.r1.PedWaiting'
											},
													
										},
									},
									PedWaiting: {
										type: 'compound',
										exit: choose([
											{
												actions: assign({Pedestrian_request: (context : StatechartContext, event) => false })
											}
										]),
										after: [
											{
												target: '#TrafficLightCtrl.main_region.on.r1.StreetAttention',
												delay: 7 * 1000
											}
										],
										initial: 'r1',
										states: {
											r1: {
												// Initial state
												initial: 'waitOn',
												
												// State definitions
												states: {
													waitOn: {
														type: 'atomic',
														entry: choose([
															{
																actions: assign({Pedestrian_request: (context : StatechartContext, event) => true })
															}
														]),
														after: [
															{
																target: '#TrafficLightCtrl.main_region.on.r1.PedWaiting.r1.waitOff',
																delay: 500
															}
														],
													},
													waitOff: {
														type: 'atomic',
														entry: choose([
															{
																actions: assign({Pedestrian_request: (context : StatechartContext, event) => false })
															}
														]),
														after: [
															{
																target: '#TrafficLightCtrl.main_region.on.r1.PedWaiting.r1.waitOn',
																delay: 500
															}
														],
													}
												}
											}
										}
									},
									StreetAttention: {
										type: 'atomic',
										entry: choose([
											{
												actions: (context : StatechartContext, event) => context.TrafficLight.yellow$.next()
											}
										]),
										after: [
											{
												target: '#TrafficLightCtrl.main_region.on.r1.StreetRed',
												delay: 2 * 1000
											}
										],
									},
									StreetRed: {
										type: 'atomic',
										entry: choose([
											{
												actions: (context : StatechartContext, event) => context.TrafficLight.red$.next()
											}
										]),
										after: [
											{
												target: '#TrafficLightCtrl.main_region.on.r1.PedestrianGreen',
												delay: 2 * 1000
											}
										],
									},
									PedestrianGreen: {
										type: 'atomic',
										entry: choose([
											{
												actions: (context : StatechartContext, event) => context.Pedestrian.green$.next()
											}
										]),
										after: [
											{
												target: '#TrafficLightCtrl.main_region.on.r1.PedestrianRed',
												delay: 7 * 1000
											}
										],
									},
									PedestrianRed: {
										type: 'atomic',
										entry: choose([
											{
												actions: (context : StatechartContext, event) => context.Pedestrian.red$.next()
											}
										]),
										after: [
											{
												target: '#TrafficLightCtrl.main_region.on.r1.StreetPrepare',
												delay: 5 * 1000
											}
										],
									},
									StreetPrepare: {
										type: 'atomic',
										entry: choose([
											{
												actions: (context : StatechartContext, event) => context.TrafficLight.preparing$.next()
											}
										]),
										after: [
											{
												target: '#TrafficLightCtrl.main_region.on.r1.StreetGreen',
												delay: 2 * 1000
											}
										],
									},
									Safe: {
										type: 'atomic',
										entry: choose([
											{
												actions: [
													(context : StatechartContext, event) => context.TrafficLight.red$.next(),
												
													(context : StatechartContext, event) => context.Pedestrian.red$.next()
												]
											}
										]),
										after: [
											{
												target: '#TrafficLightCtrl.main_region.on.r1.StreetPrepare',
												delay: 10 * 1000
											}
										],
									}
								}
							}
						}
					},
					off: {
						type: 'compound',
						entry: choose([
							{
								actions: [
									(context : StatechartContext, event) => context.TrafficLight.off$.next(),
								
									(context : StatechartContext, event) => context.Pedestrian.off$.next()
								]
							}
						]),
						on: {
							onOff: {
								target: '#TrafficLightCtrl.main_region.on'
							},
									
						},
						initial: 'r1',
						states: {
							r1: {
								// Initial state
								initial: 'YellowOn',
								
								// State definitions
								states: {
									YellowOn: {
										type: 'atomic',
										entry: choose([
											{
												actions: [
													(context : StatechartContext, event) => context.TrafficLight.yellow$.next(),
												
													assign({Pedestrian_request: (context : StatechartContext, event) => false })
												]
											}
										]),
										after: [
											{
												target: '#TrafficLightCtrl.main_region.off.r1.YellowOff',
												delay: 500
											}
										],
									},
									YellowOff: {
										type: 'atomic',
										entry: choose([
											{
												actions: [
													(context : StatechartContext, event) => context.TrafficLight.off$.next(),
												
													assign({Pedestrian_request: (context : StatechartContext, event) => false })
												]
											}
										]),
										after: [
											{
												target: '#TrafficLightCtrl.main_region.off.r1.YellowOn',
												delay: 500
											}
										],
									}
								}
							}
						}
					}
				}
			}
		}
	}
);

