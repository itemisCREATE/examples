import { Event } from './EventQueue';
export function sc_event(id) {
    return function (target, propertyKey, descriptor) {
        var originalMethod = descriptor.value;
        descriptor.value = function () {
            var args = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                args[_i - 0] = arguments[_i];
            }
            var result = originalMethod.apply(this, args);
            if (this.statemachineEventHandler !== undefined) {
                var event_1 = new Event(this, id, null);
                this.statemachineEventHandler.raiseEvent(event_1);
            }
        };
        return descriptor;
    };
}
