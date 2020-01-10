import { Machine, State, actions, assign, send, sendParent, interpret, spawn, EventObject} from 'xstate';


export const wizardMachine = Machine(
{
	id: 'wizard',
	context: {
		one: null,
		two: null,
		three: null
	}
	,
	initial: 'one',
	states: {
		one: {
			type: 'atomic',
			id: 'one',
			on: {
				NEXT: {
					target: 'two', 
					actions: ['assignOne']
				}
			},
		},
		two: {
			type: 'atomic',
			id: 'two',
			on: {
				NEXT: {
					target: 'three', 
					actions: ['assignTwo']
				}
			},
		},
		three: {
			type: 'atomic',
			id: 'three',
			on: {
				NEXT: {
					target: 'loading', 
					actions: ['assignThree']
				}
			},
		},
		loading: {
			type: 'atomic',
			id: 'loading',
			entry:['submit'],
			on: {
				'': [
					{
						target: 'failure', 
						cond: 'getFailure'
					},
					{
						target: 'success', 
						cond: 'getSuccess'
					}
				]
			},
		},
		failure: {
			type: 'atomic',
			id: 'failure',
			on: {
				RETRY: {
					target: 'loading'
				}
			},
		},
		success: {
			type: 'atomic',
			id: 'success',
			on: {
			},
		}
	}
}
,{
	actions: {
		assignOne: {
			//Add functionality for assignOne
		},
		assignTwo: {
			//Add functionality for assignTwo
		},
		assignThree: {
			//Add functionality for assignThree
		},
		submit: {
			//Add functionality for submit
		}
	}
	,
	guards: {
		getFailure: function (context : any, event : EventObject) {
			//Add functionality for getFailure
			return false;
		},
		getSuccess: function (context : any, event : EventObject) {
			//Add functionality for getSuccess
			return false;
		}
	}
}
);
