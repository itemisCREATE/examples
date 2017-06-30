
import {Event} from './EventQueue'

export function sc_event(id:string) {
  return function (target: Object, propertyKey: string, descriptor: TypedPropertyDescriptor<any>) {

     var originalMethod = descriptor.value;
      descriptor.value = function(...args: any[]) {
      var result = originalMethod.apply(this, args);
      if (this.statemachineEventHandler !== undefined) {
		let event = new Event(this, id, null);
        this.statemachineEventHandler.raiseEvent(event);
      }
    };
    return descriptor;
  }
}
