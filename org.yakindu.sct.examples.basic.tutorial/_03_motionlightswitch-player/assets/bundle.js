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
                    this.stateVector = [null];
                    this.trace = (new com.yakindu.core.rx.Observable());
                    if (this.timerService === undefined) {
                        this.timerService = null;
                    }
                    this.timeEvents = [false];
                    this.inEventQueue = ([]);
                    if (this.isExecuting === undefined) {
                        this.isExecuting = false;
                    }
                    if (this.switchEvent === undefined) {
                        this.switchEvent = false;
                    }
                    if (this.changeBrightness === undefined) {
                        this.changeBrightness = false;
                    }
                    if (this.toggleMode === undefined) {
                        this.toggleMode = false;
                    }
                    if (this.motionDetected === undefined) {
                        this.motionDetected = false;
                    }
                    if (this.brightness === undefined) {
                        this.brightness = 0;
                    }
                    for (let i = 0; i < 1; i++) {
                        {
                            this.stateVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    this.clearInEvents();
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
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
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_ENTER, this)));
                    this.enterSequence_main_default();
                    this.isExecuting = false;
                }
                exit() {
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_EXIT, this)));
                    this.exitSequence_main();
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
                    this.switchEvent = false;
                    this.changeBrightness = false;
                    this.toggleMode = false;
                    this.motionDetected = false;
                    this.timeEvents[0] = false;
                }
                microStep() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_MOTIONSENSING_R1_OFF:
                            this.main_MotionSensing_r1_Off_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MOTIONSENSING_R1_ON:
                            this.main_MotionSensing_r1_On_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_R1_OFF:
                            this.main_Manual_r1_Off_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_R1_ON:
                            this.main_Manual_r1_On_react(-1);
                            break;
                        default:
                            break;
                    }
                }
                runCycle() {
                    if (this.timerService == null) {
                        throw Object.defineProperty(new Error("Timer service must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
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
                    } while ((((((this.switchEvent || this.changeBrightness) || this.toggleMode) || this.motionDetected) || this.timeEvents[0])));
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
                        case sct.yakindu.io.Statemachine.State.MAIN_MOTIONSENSING:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_MOTIONSENSING]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_MOTIONSENSING_R1_ON]];
                        case sct.yakindu.io.Statemachine.State.MAIN_MOTIONSENSING_R1_OFF:
                            return this.stateVector[0] === Statemachine.State.MAIN_MOTIONSENSING_R1_OFF;
                        case sct.yakindu.io.Statemachine.State.MAIN_MOTIONSENSING_R1_ON:
                            return this.stateVector[0] === Statemachine.State.MAIN_MOTIONSENSING_R1_ON;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_MANUAL]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_MANUAL_R1_ON]];
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_R1_OFF:
                            return this.stateVector[0] === Statemachine.State.MAIN_MANUAL_R1_OFF;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_R1_ON:
                            return this.stateVector[0] === Statemachine.State.MAIN_MANUAL_R1_ON;
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
                getTrace() {
                    return this.trace;
                }
                raiseSwitch() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.switchEvent = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.SWITCH, null)));
                    this.runCycle();
                }
                raiseChangeBrightness() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.changeBrightness = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.CHANGEBRIGHTNESS, null)));
                    this.runCycle();
                }
                raiseToggleMode() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.toggleMode = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.TOGGLEMODE, null)));
                    this.runCycle();
                }
                raiseMotionDetected() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.motionDetected = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.MOTIONDETECTED, null)));
                    this.runCycle();
                }
                getBrightness() {
                    return this.brightness;
                }
                setBrightness(value) {
                    this.brightness = value;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_main_MotionSensing_r1_Off() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_main_MotionSensing_r1_On() {
                    this.timerService.setTimer(this, 0, (30 * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 0)));
                    this.setBrightness(1);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_main_Manual_r1_Off() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                exitAction_main_MotionSensing_r1_On() {
                    this.timerService.unsetTimer(this, 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 0)));
                }
                enterSequence_main_MotionSensing_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_MOTIONSENSING, null, null)));
                    this.enterSequence_main_MotionSensing_r1_default();
                }
                enterSequence_main_MotionSensing_r1_Off_default() {
                    this.entryAction_main_MotionSensing_r1_Off();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_MOTIONSENSING_R1_OFF, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_MOTIONSENSING_R1_OFF;
                }
                enterSequence_main_MotionSensing_r1_On_default() {
                    this.entryAction_main_MotionSensing_r1_On();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_MOTIONSENSING_R1_ON, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_MOTIONSENSING_R1_ON;
                }
                enterSequence_main_Manual_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_MANUAL, null, null)));
                    this.enterSequence_main_Manual_r1_default();
                }
                enterSequence_main_Manual_r1_Off_default() {
                    this.entryAction_main_Manual_r1_Off();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_MANUAL_R1_OFF, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_MANUAL_R1_OFF;
                }
                enterSequence_main_Manual_r1_On_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_MANUAL_R1_ON, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_MANUAL_R1_ON;
                }
                enterSequence_main_default() {
                    this.react_main__entry_Default();
                }
                enterSequence_main_MotionSensing_r1_default() {
                    this.react_main_MotionSensing_r1__entry_Default();
                }
                enterSequence_main_Manual_r1_default() {
                    this.react_main_Manual_r1__entry_Default();
                }
                exitSequence_main_MotionSensing() {
                    this.exitSequence_main_MotionSensing_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MOTIONSENSING, null, null)));
                }
                exitSequence_main_MotionSensing_r1_Off() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MOTIONSENSING_R1_OFF, null, null)));
                }
                exitSequence_main_MotionSensing_r1_On() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_MotionSensing_r1_On();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MOTIONSENSING_R1_ON, null, null)));
                }
                exitSequence_main_Manual() {
                    this.exitSequence_main_Manual_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL, null, null)));
                }
                exitSequence_main_Manual_r1_Off() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL_R1_OFF, null, null)));
                }
                exitSequence_main_Manual_r1_On() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL_R1_ON, null, null)));
                }
                exitSequence_main() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_MOTIONSENSING_R1_OFF:
                            this.exitSequence_main_MotionSensing_r1_Off();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MOTIONSENSING, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MOTIONSENSING_R1_ON:
                            this.exitSequence_main_MotionSensing_r1_On();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MOTIONSENSING, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_R1_OFF:
                            this.exitSequence_main_Manual_r1_Off();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_R1_ON:
                            this.exitSequence_main_Manual_r1_On();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL, null, null)));
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_MotionSensing_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_MOTIONSENSING_R1_OFF:
                            this.exitSequence_main_MotionSensing_r1_Off();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MOTIONSENSING_R1_ON:
                            this.exitSequence_main_MotionSensing_r1_On();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_Manual_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_R1_OFF:
                            this.exitSequence_main_Manual_r1_Off();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_R1_ON:
                            this.exitSequence_main_Manual_r1_On();
                            break;
                        default:
                            break;
                    }
                }
                react_main_MotionSensing_r1__entry_Default() {
                    this.enterSequence_main_MotionSensing_r1_Off_default();
                }
                react_main_Manual_r1__entry_Default() {
                    this.enterSequence_main_Manual_r1_Off_default();
                }
                react_main__entry_Default() {
                    this.enterSequence_main_MotionSensing_default();
                }
                react(transitioned_before) {
                    return transitioned_before;
                }
                main_MotionSensing_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.toggleMode) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MOTIONSENSING, null, 0)));
                            this.exitSequence_main_MotionSensing();
                            this.enterSequence_main_Manual_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_MotionSensing_r1_Off_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.motionDetected) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MOTIONSENSING_R1_OFF, null, 0)));
                            this.exitSequence_main_MotionSensing_r1_Off();
                            this.enterSequence_main_MotionSensing_r1_On_default();
                            this.main_MotionSensing_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_MotionSensing_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_MotionSensing_r1_On_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[0]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MOTIONSENSING_R1_ON, null, 0)));
                            this.exitSequence_main_MotionSensing_r1_On();
                            this.timeEvents[0] = false;
                            this.enterSequence_main_MotionSensing_r1_Off_default();
                            this.main_MotionSensing_react(0);
                            transitioned_after = 0;
                        }
                        else {
                            if (this.motionDetected) {
                                this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MOTIONSENSING_R1_ON, null, 1)));
                                this.exitSequence_main_MotionSensing_r1_On();
                                this.enterSequence_main_MotionSensing_r1_On_default();
                                this.main_MotionSensing_react(0);
                                transitioned_after = 0;
                            }
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_MotionSensing_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Manual_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.toggleMode) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MANUAL, null, 0)));
                            this.exitSequence_main_Manual();
                            this.enterSequence_main_MotionSensing_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Manual_r1_Off_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.switchEvent) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MANUAL_R1_OFF, null, 0)));
                            this.exitSequence_main_Manual_r1_Off();
                            this.setBrightness(10);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                            this.enterSequence_main_Manual_r1_On_default();
                            this.main_Manual_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_Manual_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Manual_r1_On_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.switchEvent) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MANUAL_R1_ON, null, 0)));
                            this.exitSequence_main_Manual_r1_On();
                            this.enterSequence_main_Manual_r1_Off_default();
                            this.main_Manual_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        if (((this.changeBrightness) && (this.getBrightness() > 1))) {
                            this.setBrightness(this.getBrightness() - 1);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                        }
                        if (((this.changeBrightness) && (this.getBrightness() <= 1))) {
                            this.setBrightness(10);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                        }
                        transitioned_after = this.main_Manual_react(transitioned_before);
                    }
                    return transitioned_after;
                }
            }
            io.Statemachine = Statemachine;
            Statemachine["__class"] = "sct.yakindu.io.Statemachine";
            Statemachine["__interfaces"] = ["com.yakindu.core.IStatemachine", "com.yakindu.core.ITimed"];
            (function (Statemachine) {
                let State;
                (function (State) {
                    State[State["MAIN_MOTIONSENSING"] = 0] = "MAIN_MOTIONSENSING";
                    State[State["MAIN_MOTIONSENSING_R1_OFF"] = 1] = "MAIN_MOTIONSENSING_R1_OFF";
                    State[State["MAIN_MOTIONSENSING_R1_ON"] = 2] = "MAIN_MOTIONSENSING_R1_ON";
                    State[State["MAIN_MANUAL"] = 3] = "MAIN_MANUAL";
                    State[State["MAIN_MANUAL_R1_OFF"] = 4] = "MAIN_MANUAL_R1_OFF";
                    State[State["MAIN_MANUAL_R1_ON"] = 5] = "MAIN_MANUAL_R1_ON";
                    State[State["$NULLSTATE$"] = 6] = "$NULLSTATE$";
                })(State = Statemachine.State || (Statemachine.State = {}));
                /**
                 * Enumeration of all features of the statechart
                 * @enum
                 * @property {sct.yakindu.io.Statemachine.Feature} NO_FEATURE
                 * @property {sct.yakindu.io.Statemachine.Feature} SWITCH
                 * @property {sct.yakindu.io.Statemachine.Feature} CHANGEBRIGHTNESS
                 * @property {sct.yakindu.io.Statemachine.Feature} TOGGLEMODE
                 * @property {sct.yakindu.io.Statemachine.Feature} MOTIONDETECTED
                 * @property {sct.yakindu.io.Statemachine.Feature} BRIGHTNESS
                 * @class
                 */
                let Feature;
                (function (Feature) {
                    Feature[Feature["NO_FEATURE"] = 0] = "NO_FEATURE";
                    Feature[Feature["SWITCH"] = 1] = "SWITCH";
                    Feature[Feature["CHANGEBRIGHTNESS"] = 2] = "CHANGEBRIGHTNESS";
                    Feature[Feature["TOGGLEMODE"] = 3] = "TOGGLEMODE";
                    Feature[Feature["MOTIONDETECTED"] = 4] = "MOTIONDETECTED";
                    Feature[Feature["BRIGHTNESS"] = 5] = "BRIGHTNESS";
                })(Feature = Statemachine.Feature || (Statemachine.Feature = {}));
            })(Statemachine = io.Statemachine || (io.Statemachine = {}));
        })(io = yakindu.io || (yakindu.io = {}));
    })(yakindu = sct.yakindu || (sct.yakindu = {}));
})(sct || (sct = {}));
