var com;
(function (com) {
    var yakindu;
    (function (yakindu) {
        var core;
        (function (core) {
            /**
             * Instances represent state machine trace events.
             * @param {com.yakindu.core.TraceEventType} type
             * @param {*} machine
             * @param {*} state
             * @param {*} feature
             * @param {*} value
             * @class
             */
            class TraceEvent {
                constructor(type, machine, state, feature, value) {
                    if (((typeof type === 'number') || type === null) && ((machine != null) || machine === null) && ((state != null) || state === null) && ((feature != null) || feature === null) && ((value != null) || value === null)) {
                        let __args = arguments;
                        if (this.type === undefined) {
                            this.type = null;
                        }
                        if (this.machine === undefined) {
                            this.machine = null;
                        }
                        if (this.state === undefined) {
                            this.state = null;
                        }
                        if (this.feature === undefined) {
                            this.feature = null;
                        }
                        if (this.value === undefined) {
                            this.value = null;
                        }
                        this.type = type;
                        this.machine = machine;
                        this.state = state;
                        this.feature = feature;
                        this.value = value;
                    }
                    else if (((typeof type === 'number') || type === null) && ((machine != null) || machine === null) && state === undefined && feature === undefined && value === undefined) {
                        let __args = arguments;
                        {
                            let __args = arguments;
                            let state = null;
                            let feature = null;
                            let value = null;
                            if (this.type === undefined) {
                                this.type = null;
                            }
                            if (this.machine === undefined) {
                                this.machine = null;
                            }
                            if (this.state === undefined) {
                                this.state = null;
                            }
                            if (this.feature === undefined) {
                                this.feature = null;
                            }
                            if (this.value === undefined) {
                                this.value = null;
                            }
                            this.type = type;
                            this.machine = machine;
                            this.state = state;
                            this.feature = feature;
                            this.value = value;
                        }
                        if (this.type === undefined) {
                            this.type = null;
                        }
                        if (this.machine === undefined) {
                            this.machine = null;
                        }
                        if (this.state === undefined) {
                            this.state = null;
                        }
                        if (this.feature === undefined) {
                            this.feature = null;
                        }
                        if (this.value === undefined) {
                            this.value = null;
                        }
                    }
                    else
                        throw new Error('invalid overload');
                }
                getType() {
                    return this.type;
                }
                getMachine() {
                    return this.machine;
                }
                getState() {
                    return this.state;
                }
                getFeature() {
                    return this.feature;
                }
                getValue() {
                    return this.value;
                }
            }
            core.TraceEvent = TraceEvent;
            TraceEvent["__class"] = "com.yakindu.core.TraceEvent";
        })(core = yakindu.core || (yakindu.core = {}));
    })(yakindu = com.yakindu || (com.yakindu = {}));
})(com || (com = {}));
(function (com) {
    var yakindu;
    (function (yakindu) {
        var core;
        (function (core) {
            /**
             * Trace event type enumeration.
             * @enum
             * @property {com.yakindu.core.TraceEventType} MACHINE_ENTER
             * @property {com.yakindu.core.TraceEventType} MACHINE_EXIT
             * @property {com.yakindu.core.TraceEventType} MACHINE_RTS_START
             * @property {com.yakindu.core.TraceEventType} MACHINE_RTS_STOP
             * @property {com.yakindu.core.TraceEventType} STATE_ENTERED
             * @property {com.yakindu.core.TraceEventType} STATE_EXITED
             * @property {com.yakindu.core.TraceEventType} STATE_TRANSITION
             * @property {com.yakindu.core.TraceEventType} EVENT_RAISED
             * @property {com.yakindu.core.TraceEventType} VARIABLE_SET
             * @property {com.yakindu.core.TraceEventType} TIME_EVENT_RAISED
             * @property {com.yakindu.core.TraceEventType} TIME_EVENT_SET
             * @property {com.yakindu.core.TraceEventType} TIME_EVENT_UNSET
             * @class
             */
            let TraceEventType;
            (function (TraceEventType) {
                TraceEventType[TraceEventType["MACHINE_ENTER"] = 0] = "MACHINE_ENTER";
                TraceEventType[TraceEventType["MACHINE_EXIT"] = 1] = "MACHINE_EXIT";
                TraceEventType[TraceEventType["MACHINE_RTS_START"] = 2] = "MACHINE_RTS_START";
                TraceEventType[TraceEventType["MACHINE_RTS_STOP"] = 3] = "MACHINE_RTS_STOP";
                TraceEventType[TraceEventType["STATE_ENTERED"] = 4] = "STATE_ENTERED";
                TraceEventType[TraceEventType["STATE_EXITED"] = 5] = "STATE_EXITED";
                TraceEventType[TraceEventType["STATE_TRANSITION"] = 6] = "STATE_TRANSITION";
                TraceEventType[TraceEventType["EVENT_RAISED"] = 7] = "EVENT_RAISED";
                TraceEventType[TraceEventType["VARIABLE_SET"] = 8] = "VARIABLE_SET";
                TraceEventType[TraceEventType["TIME_EVENT_RAISED"] = 9] = "TIME_EVENT_RAISED";
                TraceEventType[TraceEventType["TIME_EVENT_SET"] = 10] = "TIME_EVENT_SET";
                TraceEventType[TraceEventType["TIME_EVENT_UNSET"] = 11] = "TIME_EVENT_UNSET";
            })(TraceEventType = core.TraceEventType || (core.TraceEventType = {}));
        })(core = yakindu.core || (yakindu.core = {}));
    })(yakindu = com.yakindu || (com.yakindu = {}));
})(com || (com = {}));
(function (com) {
    var yakindu;
    (function (yakindu) {
        var core;
        (function (core) {
            var rx;
            (function (rx) {
                class Observable {
                    constructor() {
                        this.observers = ([]);
                    }
                    next(value) {
                        for (let index = 0; index < this.observers.length; index++) {
                            let observer = this.observers[index];
                            {
                                observer.next(value);
                            }
                        }
                    }
                    subscribe(observer) {
                        return observer != null ? /* add */ (this.observers.push(observer) > 0) : false;
                    }
                    unsubscribe(observer) {
                        return observer != null ? /* remove */ (a => { let index = a.indexOf(observer); if (index >= 0) {
                            a.splice(index, 1);
                            return true;
                        }
                        else {
                            return false;
                        } })(this.observers) : false;
                    }
                }
                rx.Observable = Observable;
                Observable["__class"] = "com.yakindu.core.rx.Observable";
            })(rx = core.rx || (core.rx = {}));
        })(core = yakindu.core || (yakindu.core = {}));
    })(yakindu = com.yakindu || (com.yakindu = {}));
})(com || (com = {}));
var sct;
(function (sct) {
    var yakindu;
    (function (yakindu) {
        var io;
        (function (io) {
            class Statemachine {
                constructor() {
                    if (this.__trafficLight === undefined) {
                        this.__trafficLight = null;
                    }
                    if (this.__pedestrian === undefined) {
                        this.__pedestrian = null;
                    }
                    this.stateVector = [null];
                    this.trace = (new com.yakindu.core.rx.Observable());
                    if (this.timerService === undefined) {
                        this.timerService = null;
                    }
                    this.timeEvents = (s => { let a = []; while (s-- > 0)
                        a.push(false); return a; })(12);
                    this.inEventQueue = ([]);
                    if (this.isExecuting === undefined) {
                        this.isExecuting = false;
                    }
                    if (this.operationCallback === undefined) {
                        this.operationCallback = null;
                    }
                    if (this.pedestrianRequest === undefined) {
                        this.pedestrianRequest = false;
                    }
                    if (this.onOff === undefined) {
                        this.onOff = false;
                    }
                    this.__trafficLight = new Statemachine.TrafficLight(this);
                    this.__pedestrian = new Statemachine.Pedestrian(this);
                    for (let i = 0; i < 1; i++) {
                        {
                            this.stateVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    this.clearInEvents();
                    this.__trafficLight.setRed(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_RED, this.__trafficLight.red)));
                    this.__trafficLight.setYellow(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.__trafficLight.yellow)));
                    this.__trafficLight.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_GREEN, this.__trafficLight.green)));
                    this.__pedestrian.setRequest(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_REQUEST, this.__pedestrian.request)));
                    this.__pedestrian.setRed(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_RED, this.__pedestrian.red)));
                    this.__pedestrian.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_GREEN, this.__pedestrian.green)));
                    this.isExecuting = false;
                }
                getIsExecuting() {
                    return this.isExecuting;
                }
                setIsExecuting(value) {
                    this.isExecuting = value;
                }
                enter() {
                    if (this.timerService == null) {
                        throw Object.defineProperty(new Error("Timer service must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
                    }
                    if (this.operationCallback == null) {
                        throw Object.defineProperty(new Error("Operation callback must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
                    }
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_ENTER, this)));
                    this.timerService.setTimer(this, 11, 200, true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 11)));
                    this.enterSequence_main_region_default();
                    this.isExecuting = false;
                }
                exit() {
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_EXIT, this)));
                    this.exitSequence_main_region();
                    this.timerService.unsetTimer(this, 11);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 11)));
                    this.isExecuting = false;
                }
                /**
                 * @see IStatemachine#isActive()
                 * @return {boolean}
                 */
                isActive() {
                    return this.stateVector[0] !== Statemachine.State.$NULLSTATE$;
                }
                /**
                 *
                 * Always returns 'false' since this state machine can never become final.
                 *
                 * @see IStatemachine#isFinal()
                 * @return {boolean}
                 */
                isFinal() {
                    return false;
                }
                clearInEvents() {
                    this.pedestrianRequest = false;
                    this.onOff = false;
                    this.timeEvents[0] = false;
                    this.timeEvents[1] = false;
                    this.timeEvents[2] = false;
                    this.timeEvents[3] = false;
                    this.timeEvents[4] = false;
                    this.timeEvents[5] = false;
                    this.timeEvents[6] = false;
                    this.timeEvents[7] = false;
                    this.timeEvents[8] = false;
                    this.timeEvents[9] = false;
                    this.timeEvents[10] = false;
                    this.timeEvents[11] = false;
                }
                microStep() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
                            this.main_region_on_r1_PedWaiting_r1_waitOn_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
                            this.main_region_on_r1_PedWaiting_r1_waitOff_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETATTENTION:
                            this.main_region_on_r1_StreetAttention_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETRED:
                            this.main_region_on_r1_StreetRed_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANGREEN:
                            this.main_region_on_r1_PedestrianGreen_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANRED:
                            this.main_region_on_r1_PedestrianRed_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETPREPARE:
                            this.main_region_on_r1_StreetPrepare_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_SAFE:
                            this.main_region_on_r1_Safe_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN:
                            this.main_region_on_r1_StreetGreen_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_OFF_R1_YELLOWON:
                            this.main_region_off_r1_YellowOn_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF:
                            this.main_region_off_r1_YellowOff_react(-1);
                            break;
                        default:
                            break;
                    }
                }
                runCycle() {
                    if (this.timerService == null) {
                        throw Object.defineProperty(new Error("Timer service must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
                    }
                    if (this.operationCallback == null) {
                        throw Object.defineProperty(new Error("Operation callback must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
                    }
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_RTS_START, this)));
                    this.nextEvent();
                    do {
                        {
                            this.microStep();
                            this.clearInEvents();
                            this.nextEvent();
                        }
                    } while (((((((((((((((this.pedestrianRequest || this.onOff) || this.timeEvents[0]) || this.timeEvents[1]) || this.timeEvents[2]) || this.timeEvents[3]) || this.timeEvents[4]) || this.timeEvents[5]) || this.timeEvents[6]) || this.timeEvents[7]) || this.timeEvents[8]) || this.timeEvents[9]) || this.timeEvents[10]) || this.timeEvents[11])));
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_RTS_STOP, this)));
                    this.isExecuting = false;
                }
                nextEvent() {
                    if (!(this.inEventQueue.length == 0)) {
                        (target => (typeof target === 'function') ? target() : target.run())(/* poll */ (a => a.length == 0 ? null : a.shift())(this.inEventQueue));
                        return;
                    }
                }
                /**
                 * Returns true if the given state is currently active otherwise false.
                 * @param {sct.yakindu.io.Statemachine.State} state
                 * @return {boolean}
                 */
                isStateActive(state) {
                    switch ((state)) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_ON]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN]];
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF]];
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETATTENTION:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_ON_R1_STREETATTENTION;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETRED:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_ON_R1_STREETRED;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANGREEN:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANGREEN;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANRED:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANRED;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETPREPARE:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_ON_R1_STREETPREPARE;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_SAFE:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_ON_R1_SAFE;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_OFF:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_OFF]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF]];
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_OFF_R1_YELLOWON:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_OFF_R1_YELLOWON;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF;
                        default:
                            return false;
                    }
                }
                setTimerService(timerService) {
                    this.timerService = timerService;
                }
                getTimerService() {
                    return this.timerService;
                }
                raiseTimeEvent(eventID) {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_RAISED, this, null, null, eventID)));
                    /* add */ (this.inEventQueue.push(() => {
                        this.timeEvents[eventID] = true;
                    }) > 0);
                    this.runCycle();
                }
                trafficLight() {
                    return this.__trafficLight;
                }
                pedestrian() {
                    return this.__pedestrian;
                }
                getTrace() {
                    return this.trace;
                }
                setOperationCallback(operationCallback) {
                    this.operationCallback = operationCallback;
                }
                raisePedestrianRequest() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.pedestrianRequest = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.PEDESTRIANREQUEST, null)));
                    this.runCycle();
                }
                raiseOnOff() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.onOff = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.ONOFF, null)));
                    this.runCycle();
                }
                entryAction_main_region_on_r1_PedWaiting() {
                    this.timerService.setTimer(this, 0, (7 * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 0)));
                }
                entryAction_main_region_on_r1_PedWaiting_r1_waitOn() {
                    this.timerService.setTimer(this, 1, 500, false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 1)));
                    this.__pedestrian.setRequest(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_REQUEST, this.__pedestrian.request)));
                }
                entryAction_main_region_on_r1_PedWaiting_r1_waitOff() {
                    this.timerService.setTimer(this, 2, 500, false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 2)));
                    this.__pedestrian.setRequest(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_REQUEST, this.__pedestrian.request)));
                }
                entryAction_main_region_on_r1_StreetAttention() {
                    this.timerService.setTimer(this, 3, (2 * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 3)));
                    this.__trafficLight.setRed(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_RED, this.__trafficLight.red)));
                    this.__trafficLight.setYellow(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.__trafficLight.yellow)));
                    this.__trafficLight.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_GREEN, this.__trafficLight.green)));
                }
                entryAction_main_region_on_r1_StreetRed() {
                    this.timerService.setTimer(this, 4, (2 * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 4)));
                    this.__trafficLight.setRed(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_RED, this.__trafficLight.red)));
                    this.__trafficLight.setYellow(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.__trafficLight.yellow)));
                    this.__trafficLight.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_GREEN, this.__trafficLight.green)));
                }
                entryAction_main_region_on_r1_PedestrianGreen() {
                    this.timerService.setTimer(this, 5, (7 * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 5)));
                    this.__pedestrian.setRed(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_RED, this.__pedestrian.red)));
                    this.__pedestrian.setGreen(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_GREEN, this.__pedestrian.green)));
                }
                entryAction_main_region_on_r1_PedestrianRed() {
                    this.timerService.setTimer(this, 6, (5 * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 6)));
                    this.__pedestrian.setRed(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_RED, this.__pedestrian.red)));
                    this.__pedestrian.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_GREEN, this.__pedestrian.green)));
                }
                entryAction_main_region_on_r1_StreetPrepare() {
                    this.timerService.setTimer(this, 7, (2 * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 7)));
                    this.__trafficLight.setRed(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_RED, this.__trafficLight.red)));
                    this.__trafficLight.setYellow(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.__trafficLight.yellow)));
                    this.__trafficLight.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_GREEN, this.__trafficLight.green)));
                }
                entryAction_main_region_on_r1_Safe() {
                    this.timerService.setTimer(this, 8, (10 * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 8)));
                    this.__trafficLight.setRed(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_RED, this.__trafficLight.red)));
                    this.__trafficLight.setYellow(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.__trafficLight.yellow)));
                    this.__trafficLight.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_GREEN, this.__trafficLight.green)));
                    this.__pedestrian.setRed(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_RED, this.__pedestrian.red)));
                    this.__pedestrian.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_GREEN, this.__pedestrian.green)));
                    this.__pedestrian.setRequest(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_REQUEST, this.__pedestrian.request)));
                }
                entryAction_main_region_on_r1_StreetGreen() {
                    this.__trafficLight.setRed(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_RED, this.__trafficLight.red)));
                    this.__trafficLight.setYellow(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.__trafficLight.yellow)));
                    this.__trafficLight.setGreen(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_GREEN, this.__trafficLight.green)));
                    this.__pedestrian.setRed(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_RED, this.__pedestrian.red)));
                    this.__pedestrian.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_GREEN, this.__pedestrian.green)));
                    this.__pedestrian.setRequest(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_REQUEST, this.__pedestrian.request)));
                }
                entryAction_main_region_off() {
                    this.__trafficLight.setRed(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_RED, this.__trafficLight.red)));
                    this.__trafficLight.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_GREEN, this.__trafficLight.green)));
                    this.__trafficLight.setYellow(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.__trafficLight.yellow)));
                    this.__pedestrian.setRed(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_RED, this.__pedestrian.red)));
                    this.__pedestrian.setGreen(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_GREEN, this.__pedestrian.green)));
                }
                entryAction_main_region_off_r1_YellowOn() {
                    this.timerService.setTimer(this, 9, 500, false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 9)));
                    this.__trafficLight.setYellow(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.__trafficLight.yellow)));
                    this.__pedestrian.setRequest(true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_REQUEST, this.__pedestrian.request)));
                }
                entryAction_main_region_off_r1_YellowOff() {
                    this.timerService.setTimer(this, 10, 500, false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 10)));
                    this.__trafficLight.setYellow(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.__trafficLight.yellow)));
                    this.__pedestrian.setRequest(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_REQUEST, this.__pedestrian.request)));
                }
                exitAction_main_region_on_r1_PedWaiting() {
                    this.timerService.unsetTimer(this, 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 0)));
                    this.__pedestrian.setRequest(false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.PEDESTRIAN_REQUEST, this.__pedestrian.request)));
                }
                exitAction_main_region_on_r1_PedWaiting_r1_waitOn() {
                    this.timerService.unsetTimer(this, 1);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 1)));
                }
                exitAction_main_region_on_r1_PedWaiting_r1_waitOff() {
                    this.timerService.unsetTimer(this, 2);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 2)));
                }
                exitAction_main_region_on_r1_StreetAttention() {
                    this.timerService.unsetTimer(this, 3);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 3)));
                }
                exitAction_main_region_on_r1_StreetRed() {
                    this.timerService.unsetTimer(this, 4);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 4)));
                }
                exitAction_main_region_on_r1_PedestrianGreen() {
                    this.timerService.unsetTimer(this, 5);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 5)));
                }
                exitAction_main_region_on_r1_PedestrianRed() {
                    this.timerService.unsetTimer(this, 6);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 6)));
                }
                exitAction_main_region_on_r1_StreetPrepare() {
                    this.timerService.unsetTimer(this, 7);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 7)));
                }
                exitAction_main_region_on_r1_Safe() {
                    this.timerService.unsetTimer(this, 8);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 8)));
                }
                exitAction_main_region_off_r1_YellowOn() {
                    this.timerService.unsetTimer(this, 9);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 9)));
                }
                exitAction_main_region_off_r1_YellowOff() {
                    this.timerService.unsetTimer(this, 10);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 10)));
                }
                enterSequence_main_region_on_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                    this.enterSequence_main_region_on_r1_default();
                }
                enterSequence_main_region_on_r1_PedWaiting_default() {
                    this.entryAction_main_region_on_r1_PedWaiting();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING, null, null)));
                    this.enterSequence_main_region_on_r1_PedWaiting_r1_default();
                }
                enterSequence_main_region_on_r1_PedWaiting_r1_waitOn_default() {
                    this.entryAction_main_region_on_r1_PedWaiting_r1_waitOn();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON;
                }
                enterSequence_main_region_on_r1_PedWaiting_r1_waitOff_default() {
                    this.entryAction_main_region_on_r1_PedWaiting_r1_waitOff();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF;
                }
                enterSequence_main_region_on_r1_StreetAttention_default() {
                    this.entryAction_main_region_on_r1_StreetAttention();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_STREETATTENTION, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_ON_R1_STREETATTENTION;
                }
                enterSequence_main_region_on_r1_StreetRed_default() {
                    this.entryAction_main_region_on_r1_StreetRed();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_STREETRED, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_ON_R1_STREETRED;
                }
                enterSequence_main_region_on_r1_PedestrianGreen_default() {
                    this.entryAction_main_region_on_r1_PedestrianGreen();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANGREEN, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANGREEN;
                }
                enterSequence_main_region_on_r1_PedestrianRed_default() {
                    this.entryAction_main_region_on_r1_PedestrianRed();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANRED, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANRED;
                }
                enterSequence_main_region_on_r1_StreetPrepare_default() {
                    this.entryAction_main_region_on_r1_StreetPrepare();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_STREETPREPARE, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_ON_R1_STREETPREPARE;
                }
                enterSequence_main_region_on_r1_Safe_default() {
                    this.entryAction_main_region_on_r1_Safe();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_SAFE, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_ON_R1_SAFE;
                }
                enterSequence_main_region_on_r1_StreetGreen_default() {
                    this.entryAction_main_region_on_r1_StreetGreen();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN;
                }
                enterSequence_main_region_off_default() {
                    this.entryAction_main_region_off();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_OFF, null, null)));
                    this.enterSequence_main_region_off_r1_default();
                }
                enterSequence_main_region_off_r1_YellowOn_default() {
                    this.entryAction_main_region_off_r1_YellowOn();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_OFF_R1_YELLOWON, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_OFF_R1_YELLOWON;
                }
                enterSequence_main_region_off_r1_YellowOff_default() {
                    this.entryAction_main_region_off_r1_YellowOff();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF;
                }
                enterSequence_main_region_default() {
                    this.react_main_region__entry_Default();
                }
                enterSequence_main_region_on_r1_default() {
                    this.react_main_region_on_r1__entry_Default();
                }
                enterSequence_main_region_on_r1_PedWaiting_r1_default() {
                    this.react_main_region_on_r1_PedWaiting_r1__entry_Default();
                }
                enterSequence_main_region_off_r1_default() {
                    this.react_main_region_off_r1__entry_Default();
                }
                exitSequence_main_region_on() {
                    this.exitSequence_main_region_on_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                }
                exitSequence_main_region_on_r1_PedWaiting() {
                    this.exitSequence_main_region_on_r1_PedWaiting_r1();
                    this.exitAction_main_region_on_r1_PedWaiting();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING, null, null)));
                }
                exitSequence_main_region_on_r1_PedWaiting_r1_waitOn() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_on_r1_PedWaiting_r1_waitOn();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON, null, null)));
                }
                exitSequence_main_region_on_r1_PedWaiting_r1_waitOff() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_on_r1_PedWaiting_r1_waitOff();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF, null, null)));
                }
                exitSequence_main_region_on_r1_StreetAttention() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_on_r1_StreetAttention();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_STREETATTENTION, null, null)));
                }
                exitSequence_main_region_on_r1_StreetRed() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_on_r1_StreetRed();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_STREETRED, null, null)));
                }
                exitSequence_main_region_on_r1_PedestrianGreen() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_on_r1_PedestrianGreen();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANGREEN, null, null)));
                }
                exitSequence_main_region_on_r1_PedestrianRed() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_on_r1_PedestrianRed();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANRED, null, null)));
                }
                exitSequence_main_region_on_r1_StreetPrepare() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_on_r1_StreetPrepare();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_STREETPREPARE, null, null)));
                }
                exitSequence_main_region_on_r1_Safe() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_on_r1_Safe();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_SAFE, null, null)));
                }
                exitSequence_main_region_on_r1_StreetGreen() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN, null, null)));
                }
                exitSequence_main_region_off() {
                    this.exitSequence_main_region_off_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_OFF, null, null)));
                }
                exitSequence_main_region_off_r1_YellowOn() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_off_r1_YellowOn();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_OFF_R1_YELLOWON, null, null)));
                }
                exitSequence_main_region_off_r1_YellowOff() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_off_r1_YellowOff();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF, null, null)));
                }
                exitSequence_main_region() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
                            this.exitSequence_main_region_on_r1_PedWaiting_r1_waitOn();
                            this.exitAction_main_region_on_r1_PedWaiting();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
                            this.exitSequence_main_region_on_r1_PedWaiting_r1_waitOff();
                            this.exitAction_main_region_on_r1_PedWaiting();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETATTENTION:
                            this.exitSequence_main_region_on_r1_StreetAttention();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETRED:
                            this.exitSequence_main_region_on_r1_StreetRed();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANGREEN:
                            this.exitSequence_main_region_on_r1_PedestrianGreen();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANRED:
                            this.exitSequence_main_region_on_r1_PedestrianRed();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETPREPARE:
                            this.exitSequence_main_region_on_r1_StreetPrepare();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_SAFE:
                            this.exitSequence_main_region_on_r1_Safe();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN:
                            this.exitSequence_main_region_on_r1_StreetGreen();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_OFF_R1_YELLOWON:
                            this.exitSequence_main_region_off_r1_YellowOn();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_OFF, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF:
                            this.exitSequence_main_region_off_r1_YellowOff();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_OFF, null, null)));
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_on_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
                            this.exitSequence_main_region_on_r1_PedWaiting_r1_waitOn();
                            this.exitAction_main_region_on_r1_PedWaiting();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
                            this.exitSequence_main_region_on_r1_PedWaiting_r1_waitOff();
                            this.exitAction_main_region_on_r1_PedWaiting();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETATTENTION:
                            this.exitSequence_main_region_on_r1_StreetAttention();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETRED:
                            this.exitSequence_main_region_on_r1_StreetRed();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANGREEN:
                            this.exitSequence_main_region_on_r1_PedestrianGreen();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANRED:
                            this.exitSequence_main_region_on_r1_PedestrianRed();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETPREPARE:
                            this.exitSequence_main_region_on_r1_StreetPrepare();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_SAFE:
                            this.exitSequence_main_region_on_r1_Safe();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN:
                            this.exitSequence_main_region_on_r1_StreetGreen();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_on_r1_PedWaiting_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON:
                            this.exitSequence_main_region_on_r1_PedWaiting_r1_waitOn();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF:
                            this.exitSequence_main_region_on_r1_PedWaiting_r1_waitOff();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_off_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_OFF_R1_YELLOWON:
                            this.exitSequence_main_region_off_r1_YellowOn();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF:
                            this.exitSequence_main_region_off_r1_YellowOff();
                            break;
                        default:
                            break;
                    }
                }
                react_main_region_on_r1_PedWaiting_r1__entry_Default() {
                    this.enterSequence_main_region_on_r1_PedWaiting_r1_waitOn_default();
                }
                react_main_region_on_r1__entry_Default() {
                    this.enterSequence_main_region_on_r1_Safe_default();
                }
                react_main_region_off_r1__entry_Default() {
                    this.enterSequence_main_region_off_r1_YellowOn_default();
                }
                react_main_region__entry_Default() {
                    this.enterSequence_main_region_off_default();
                }
                react(transitioned_before) {
                    if (this.timeEvents[11]) {
                        this.operationCallback.synchronize();
                    }
                    return transitioned_before;
                }
                main_region_on_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.onOff) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON, null, 0)));
                            this.exitSequence_main_region_on();
                            this.enterSequence_main_region_off_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_PedWaiting_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[0]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING, null, 0)));
                            this.exitSequence_main_region_on_r1_PedWaiting();
                            this.timeEvents[0] = false;
                            this.enterSequence_main_region_on_r1_StreetAttention_default();
                            this.main_region_on_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_PedWaiting_r1_waitOn_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[1]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON, null, 0)));
                            this.exitSequence_main_region_on_r1_PedWaiting_r1_waitOn();
                            this.timeEvents[1] = false;
                            this.enterSequence_main_region_on_r1_PedWaiting_r1_waitOff_default();
                            this.main_region_on_r1_PedWaiting_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_r1_PedWaiting_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_PedWaiting_r1_waitOff_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[2]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF, null, 0)));
                            this.exitSequence_main_region_on_r1_PedWaiting_r1_waitOff();
                            this.timeEvents[2] = false;
                            this.enterSequence_main_region_on_r1_PedWaiting_r1_waitOn_default();
                            this.main_region_on_r1_PedWaiting_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_r1_PedWaiting_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_StreetAttention_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[3]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_STREETATTENTION, null, 0)));
                            this.exitSequence_main_region_on_r1_StreetAttention();
                            this.timeEvents[3] = false;
                            this.enterSequence_main_region_on_r1_StreetRed_default();
                            this.main_region_on_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_StreetRed_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[4]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_STREETRED, null, 0)));
                            this.exitSequence_main_region_on_r1_StreetRed();
                            this.timeEvents[4] = false;
                            this.enterSequence_main_region_on_r1_PedestrianGreen_default();
                            this.main_region_on_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_PedestrianGreen_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[5]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANGREEN, null, 0)));
                            this.exitSequence_main_region_on_r1_PedestrianGreen();
                            this.timeEvents[5] = false;
                            this.enterSequence_main_region_on_r1_PedestrianRed_default();
                            this.main_region_on_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_PedestrianRed_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[6]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_PEDESTRIANRED, null, 0)));
                            this.exitSequence_main_region_on_r1_PedestrianRed();
                            this.timeEvents[6] = false;
                            this.enterSequence_main_region_on_r1_StreetPrepare_default();
                            this.main_region_on_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_StreetPrepare_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[7]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_STREETPREPARE, null, 0)));
                            this.exitSequence_main_region_on_r1_StreetPrepare();
                            this.timeEvents[7] = false;
                            this.enterSequence_main_region_on_r1_StreetGreen_default();
                            this.main_region_on_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_Safe_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[8]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_SAFE, null, 0)));
                            this.exitSequence_main_region_on_r1_Safe();
                            this.timeEvents[8] = false;
                            this.enterSequence_main_region_on_r1_StreetPrepare_default();
                            this.main_region_on_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_on_r1_StreetGreen_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.pedestrianRequest) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_ON_R1_STREETGREEN, null, 0)));
                            this.exitSequence_main_region_on_r1_StreetGreen();
                            this.enterSequence_main_region_on_r1_PedWaiting_default();
                            this.main_region_on_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_on_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_off_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.onOff) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_OFF, null, 0)));
                            this.exitSequence_main_region_off();
                            this.enterSequence_main_region_on_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_off_r1_YellowOn_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[9]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_OFF_R1_YELLOWON, null, 0)));
                            this.exitSequence_main_region_off_r1_YellowOn();
                            this.timeEvents[9] = false;
                            this.enterSequence_main_region_off_r1_YellowOff_default();
                            this.main_region_off_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_off_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_off_r1_YellowOff_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[10]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_OFF_R1_YELLOWOFF, null, 0)));
                            this.exitSequence_main_region_off_r1_YellowOff();
                            this.timeEvents[10] = false;
                            this.enterSequence_main_region_off_r1_YellowOn_default();
                            this.main_region_off_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_off_react(transitioned_before);
                    }
                    return transitioned_after;
                }
            }
            io.Statemachine = Statemachine;
            Statemachine["__class"] = "sct.yakindu.io.Statemachine";
            Statemachine["__interfaces"] = ["com.yakindu.core.IStatemachine", "com.yakindu.core.ITimed"];
            (function (Statemachine) {
                class TrafficLight {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.red === undefined) {
                            this.red = false;
                        }
                        if (this.yellow === undefined) {
                            this.yellow = false;
                        }
                        if (this.green === undefined) {
                            this.green = false;
                        }
                        this.parent = parent;
                    }
                    getRed() {
                        return this.red;
                    }
                    setRed(value) {
                        this.red = value;
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this.parent, null, Statemachine.Feature.TRAFFICLIGHT_RED, this.red)));
                    }
                    getYellow() {
                        return this.yellow;
                    }
                    setYellow(value) {
                        this.yellow = value;
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this.parent, null, Statemachine.Feature.TRAFFICLIGHT_YELLOW, this.yellow)));
                    }
                    getGreen() {
                        return this.green;
                    }
                    setGreen(value) {
                        this.green = value;
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this.parent, null, Statemachine.Feature.TRAFFICLIGHT_GREEN, this.green)));
                    }
                }
                Statemachine.TrafficLight = TrafficLight;
                TrafficLight["__class"] = "sct.yakindu.io.Statemachine.TrafficLight";
                class Pedestrian {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.request === undefined) {
                            this.request = false;
                        }
                        if (this.red === undefined) {
                            this.red = false;
                        }
                        if (this.green === undefined) {
                            this.green = false;
                        }
                        this.parent = parent;
                    }
                    getRequest() {
                        return this.request;
                    }
                    setRequest(value) {
                        this.request = value;
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this.parent, null, Statemachine.Feature.PEDESTRIAN_REQUEST, this.request)));
                    }
                    getRed() {
                        return this.red;
                    }
                    setRed(value) {
                        this.red = value;
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this.parent, null, Statemachine.Feature.PEDESTRIAN_RED, this.red)));
                    }
                    getGreen() {
                        return this.green;
                    }
                    setGreen(value) {
                        this.green = value;
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this.parent, null, Statemachine.Feature.PEDESTRIAN_GREEN, this.green)));
                    }
                }
                Statemachine.Pedestrian = Pedestrian;
                Pedestrian["__class"] = "sct.yakindu.io.Statemachine.Pedestrian";
                let State;
                (function (State) {
                    State[State["MAIN_REGION_ON"] = 0] = "MAIN_REGION_ON";
                    State[State["MAIN_REGION_ON_R1_PEDWAITING"] = 1] = "MAIN_REGION_ON_R1_PEDWAITING";
                    State[State["MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON"] = 2] = "MAIN_REGION_ON_R1_PEDWAITING_R1_WAITON";
                    State[State["MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF"] = 3] = "MAIN_REGION_ON_R1_PEDWAITING_R1_WAITOFF";
                    State[State["MAIN_REGION_ON_R1_STREETATTENTION"] = 4] = "MAIN_REGION_ON_R1_STREETATTENTION";
                    State[State["MAIN_REGION_ON_R1_STREETRED"] = 5] = "MAIN_REGION_ON_R1_STREETRED";
                    State[State["MAIN_REGION_ON_R1_PEDESTRIANGREEN"] = 6] = "MAIN_REGION_ON_R1_PEDESTRIANGREEN";
                    State[State["MAIN_REGION_ON_R1_PEDESTRIANRED"] = 7] = "MAIN_REGION_ON_R1_PEDESTRIANRED";
                    State[State["MAIN_REGION_ON_R1_STREETPREPARE"] = 8] = "MAIN_REGION_ON_R1_STREETPREPARE";
                    State[State["MAIN_REGION_ON_R1_SAFE"] = 9] = "MAIN_REGION_ON_R1_SAFE";
                    State[State["MAIN_REGION_ON_R1_STREETGREEN"] = 10] = "MAIN_REGION_ON_R1_STREETGREEN";
                    State[State["MAIN_REGION_OFF"] = 11] = "MAIN_REGION_OFF";
                    State[State["MAIN_REGION_OFF_R1_YELLOWON"] = 12] = "MAIN_REGION_OFF_R1_YELLOWON";
                    State[State["MAIN_REGION_OFF_R1_YELLOWOFF"] = 13] = "MAIN_REGION_OFF_R1_YELLOWOFF";
                    State[State["$NULLSTATE$"] = 14] = "$NULLSTATE$";
                })(State = Statemachine.State || (Statemachine.State = {}));
                /**
                 * Enumeration of all features of the statechart
                 * @enum
                 * @property {sct.yakindu.io.Statemachine.Feature} NO_FEATURE
                 * @property {sct.yakindu.io.Statemachine.Feature} TRAFFICLIGHT_RED
                 * @property {sct.yakindu.io.Statemachine.Feature} TRAFFICLIGHT_YELLOW
                 * @property {sct.yakindu.io.Statemachine.Feature} TRAFFICLIGHT_GREEN
                 * @property {sct.yakindu.io.Statemachine.Feature} PEDESTRIAN_REQUEST
                 * @property {sct.yakindu.io.Statemachine.Feature} PEDESTRIAN_RED
                 * @property {sct.yakindu.io.Statemachine.Feature} PEDESTRIAN_GREEN
                 * @property {sct.yakindu.io.Statemachine.Feature} PEDESTRIANREQUEST
                 * @property {sct.yakindu.io.Statemachine.Feature} ONOFF
                 * @class
                 */
                let Feature;
                (function (Feature) {
                    Feature[Feature["NO_FEATURE"] = 0] = "NO_FEATURE";
                    Feature[Feature["TRAFFICLIGHT_RED"] = 1] = "TRAFFICLIGHT_RED";
                    Feature[Feature["TRAFFICLIGHT_YELLOW"] = 2] = "TRAFFICLIGHT_YELLOW";
                    Feature[Feature["TRAFFICLIGHT_GREEN"] = 3] = "TRAFFICLIGHT_GREEN";
                    Feature[Feature["PEDESTRIAN_REQUEST"] = 4] = "PEDESTRIAN_REQUEST";
                    Feature[Feature["PEDESTRIAN_RED"] = 5] = "PEDESTRIAN_RED";
                    Feature[Feature["PEDESTRIAN_GREEN"] = 6] = "PEDESTRIAN_GREEN";
                    Feature[Feature["PEDESTRIANREQUEST"] = 7] = "PEDESTRIANREQUEST";
                    Feature[Feature["ONOFF"] = 8] = "ONOFF";
                })(Feature = Statemachine.Feature || (Statemachine.Feature = {}));
            })(Statemachine = io.Statemachine || (io.Statemachine = {}));
        })(io = yakindu.io || (yakindu.io = {}));
    })(yakindu = sct.yakindu || (sct.yakindu = {}));
})(sct || (sct = {}));
