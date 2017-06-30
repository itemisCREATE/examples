
import {Subject} from 'rxjs/Subject';

export class Event {

	constructor(
		public source : any,
		public identifier : string,
		public data : any) {
	}
}

export class EventQueue {

  queue:Event[];
  head:Event;
  locked:boolean;
  onProcess:Subject<Event>;

  process() {
    if (!this.locked) {
      this.locked = true;
      while (this.queue.length > 0) {
        this.head = this.queue.shift();
        this.onProcess.next(this.head);
	  }

	  this.locked = false;
    }
  }

  trigger(event:Event) {
    this.queue.push(event);
    this.process();
  }

  constructor() {
    this.queue = [];
    this.onProcess = new Subject<Event>();
  }
}

		
export class StatemachineEventHandlerService {
	
	onCall:Subject<Event> = new Subject<Event>();
	
	constructor() {}
	
	raiseEvent(event:Event) {
		this.onCall.next(event);
	}
}
