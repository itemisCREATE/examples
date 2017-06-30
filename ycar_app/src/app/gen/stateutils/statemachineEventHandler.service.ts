import {Injectable} from '@angular/core';
import {Subject} from 'rxjs/Subject';
import {Event} from './EventQueue'

@Injectable()
export class StatemachineEventHandlerService {

	public onCall:Subject<Event> = new Subject<Event>();

	constructor() {}

	public raiseEvent(event:Event) {
		this.onCall.next(event);
	}
} 
