import { Subject } from 'rxjs/Subject';
export var Event = (function () {
    function Event(source, identifier, data) {
        this.source = source;
        this.identifier = identifier;
        this.data = data;
    }
    return Event;
}());
export var EventQueue = (function () {
    function EventQueue() {
        this.queue = [];
        this.onProcess = new Subject();
    }
    EventQueue.prototype.process = function () {
        if (!this.locked) {
            this.locked = true;
            while (this.queue.length > 0) {
                this.head = this.queue.shift();
                this.onProcess.next(this.head);
            }
            this.locked = false;
        }
    };
    EventQueue.prototype.trigger = function (event) {
        this.queue.push(event);
        this.process();
    };
    return EventQueue;
}());
