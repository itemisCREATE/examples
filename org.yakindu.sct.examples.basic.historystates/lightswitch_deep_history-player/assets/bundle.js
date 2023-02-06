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
                    if (this.__user === undefined) {
                        this.__user = null;
                    }
                    if (this.__sensor === undefined) {
                        this.__sensor = null;
                    }
                    if (this.__lum_sensor === undefined) {
                        this.__lum_sensor = null;
                    }
                    this.historyVector = [null, null, null];
                    this.stateVector = [null];
                    this.trace = (new com.yakindu.core.rx.Observable());
                    if (this.timerService === undefined) {
                        this.timerService = null;
                    }
                    this.timeEvents = [false];
                    this.inEventQueue = ([]);
                    if (this.brightness === undefined) {
                        this.brightness = 0;
                    }
                    if (this.isExecuting === undefined) {
                        this.isExecuting = false;
                    }
                    this.__user = new Statemachine.User(this);
                    this.__sensor = new Statemachine.Sensor(this);
                    this.__lum_sensor = new Statemachine.Lum_sensor(this);
                    for (let i = 0; i < 1; i++) {
                        {
                            this.stateVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    for (let i = 0; i < 3; i++) {
                        {
                            this.historyVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    this.clearInEvents();
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_BRIGHTNESS, this.brightness)));
                    this.isExecuting = false;
                }
                getBrightness() {
                    return this.brightness;
                }
                setBrightness(value) {
                    this.brightness = value;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_BRIGHTNESS, this.brightness)));
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
                    this.__user.on_button = false;
                    this.__user.off_button = false;
                    this.__user.mode_button = false;
                    this.__sensor.motion = false;
                    this.__lum_sensor.bright = false;
                    this.__lum_sensor.dark = false;
                    this.timeEvents[0] = false;
                }
                microStep() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_MANUALMODE:
                            this.main_region_ManualMode_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE:
                            this.main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED:
                            this.main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE:
                            this.main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED:
                            this.main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected_react(-1);
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
                    } while ((((((((this.__user.on_button || this.__user.off_button) || this.__user.mode_button) || this.__sensor.motion) || this.__lum_sensor.bright) || this.__lum_sensor.dark) || this.timeEvents[0])));
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
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_MANUALMODE:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_MANUALMODE;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_AUTOMATICMODE]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED]];
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED]];
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED]];
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED;
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
                user() {
                    return this.__user;
                }
                sensor() {
                    return this.__sensor;
                }
                lum_sensor() {
                    return this.__lum_sensor;
                }
                getTrace() {
                    return this.trace;
                }
                entryAction_main_region_ManualMode() {
                    this.setBrightness(this.getBrightness() + 1);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_BRIGHTNESS, this.brightness)));
                }
                entryAction_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_BRIGHTNESS, this.brightness)));
                }
                entryAction_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected() {
                    this.setBrightness(1);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_BRIGHTNESS, this.brightness)));
                }
                entryAction_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_BRIGHTNESS, this.brightness)));
                }
                entryAction_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected() {
                    this.timerService.setTimer(this, 0, (30 * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 0)));
                    this.setBrightness(1);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_BRIGHTNESS, this.brightness)));
                }
                exitAction_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected() {
                    this.timerService.unsetTimer(this, 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 0)));
                }
                enterSequence_main_region_ManualMode_default() {
                    this.entryAction_main_region_ManualMode();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_MANUALMODE, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_MANUALMODE;
                }
                enterSequence_main_region_AutomaticMode_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE, null, null)));
                    this.enterSequence_main_region_AutomaticMode_r1_default();
                }
                enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE, null, null)));
                    this.enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_default();
                    this.historyVector[0] = this.stateVector[0];
                }
                enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle_default() {
                    this.entryAction_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE;
                    this.historyVector[1] = this.stateVector[0];
                }
                enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected_default() {
                    this.entryAction_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED;
                    this.historyVector[1] = this.stateVector[0];
                }
                enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE, null, null)));
                    this.enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_default();
                    this.historyVector[0] = this.stateVector[0];
                }
                enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle_default() {
                    this.entryAction_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE;
                    this.historyVector[2] = this.stateVector[0];
                }
                enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected_default() {
                    this.entryAction_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED;
                    this.historyVector[2] = this.stateVector[0];
                }
                enterSequence_main_region_default() {
                    this.react_main_region__entry_Default();
                }
                enterSequence_main_region_AutomaticMode_r1_default() {
                    this.react_main_region_AutomaticMode_r1__entry_Default();
                }
                deepEnterSequence_main_region_AutomaticMode_r1() {
                    switch ((this.historyVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE:
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE, null, null)));
                            this.deepEnterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED:
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE, null, null)));
                            this.deepEnterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE:
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE, null, null)));
                            this.deepEnterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED:
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE, null, null)));
                            this.deepEnterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1();
                            break;
                        default:
                            break;
                    }
                }
                enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_default() {
                    this.react_main_region_AutomaticMode_r1_TwilightDetectionMode_r1__entry_Default();
                }
                deepEnterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1() {
                    switch ((this.historyVector[1])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE:
                            this.enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED:
                            this.enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected_default();
                            break;
                        default:
                            break;
                    }
                }
                enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_default() {
                    this.react_main_region_AutomaticMode_r1_MotionDetectionMode_r1__entry_Default();
                }
                deepEnterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1() {
                    switch ((this.historyVector[2])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE:
                            this.enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED:
                            this.enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected_default();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_ManualMode() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_MANUALMODE, null, null)));
                }
                exitSequence_main_region_AutomaticMode() {
                    this.exitSequence_main_region_AutomaticMode_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE, null, null)));
                }
                exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode() {
                    this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE, null, null)));
                }
                exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE, null, null)));
                }
                exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED, null, null)));
                }
                exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode() {
                    this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE, null, null)));
                }
                exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE, null, null)));
                }
                exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED, null, null)));
                }
                exitSequence_main_region() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_MANUALMODE:
                            this.exitSequence_main_region_ManualMode();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE:
                            this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED:
                            this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE:
                            this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED:
                            this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE, null, null)));
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_AutomaticMode_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE:
                            this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED:
                            this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE:
                            this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED:
                            this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE, null, null)));
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE:
                            this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED:
                            this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE:
                            this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED:
                            this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected();
                            break;
                        default:
                            break;
                    }
                }
                react_main_region_AutomaticMode_r1_TwilightDetectionMode_r1__entry_Default() {
                    this.enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle_default();
                }
                react_main_region_AutomaticMode_r1_MotionDetectionMode_r1__entry_Default() {
                    this.enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle_default();
                }
                react_main_region_AutomaticMode_r1__entry_Default() {
                    if (this.historyVector[0] !== Statemachine.State.$NULLSTATE$) {
                        this.deepEnterSequence_main_region_AutomaticMode_r1();
                    }
                    else {
                        this.enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_default();
                    }
                }
                react_main_region__entry_Default() {
                    this.enterSequence_main_region_AutomaticMode_default();
                }
                react(transitioned_before) {
                    return transitioned_before;
                }
                main_region_ManualMode_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__user.off_button) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_MANUALMODE, null, 0)));
                            this.exitSequence_main_region_ManualMode();
                            this.enterSequence_main_region_AutomaticMode_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                        else {
                            if (((this.__user.on_button) && (this.getBrightness() < 10))) {
                                this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_MANUALMODE, null, 1)));
                                this.exitSequence_main_region_ManualMode();
                                this.enterSequence_main_region_ManualMode_default();
                                this.react(0);
                                transitioned_after = 0;
                            }
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_AutomaticMode_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__user.on_button) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE, null, 0)));
                            this.exitSequence_main_region_AutomaticMode();
                            this.enterSequence_main_region_ManualMode_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_AutomaticMode_r1_TwilightDetectionMode_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__user.mode_button) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE, null, 0)));
                            this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode();
                            this.enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_default();
                            this.main_region_AutomaticMode_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_AutomaticMode_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__lum_sensor.dark) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE, null, 0)));
                            this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle();
                            this.enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected_default();
                            this.main_region_AutomaticMode_r1_TwilightDetectionMode_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_AutomaticMode_r1_TwilightDetectionMode_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__lum_sensor.bright) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED, null, 0)));
                            this.exitSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_TwilightDetected();
                            this.enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_r1_Idle_default();
                            this.main_region_AutomaticMode_r1_TwilightDetectionMode_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_AutomaticMode_r1_TwilightDetectionMode_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_AutomaticMode_r1_MotionDetectionMode_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__user.mode_button) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE, null, 0)));
                            this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode();
                            this.enterSequence_main_region_AutomaticMode_r1_TwilightDetectionMode_default();
                            this.main_region_AutomaticMode_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_AutomaticMode_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__sensor.motion) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE, null, 0)));
                            this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle();
                            this.enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected_default();
                            this.main_region_AutomaticMode_r1_MotionDetectionMode_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_AutomaticMode_r1_MotionDetectionMode_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[0]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED, null, 0)));
                            this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected();
                            this.timeEvents[0] = false;
                            this.enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_Idle_default();
                            this.main_region_AutomaticMode_r1_MotionDetectionMode_react(0);
                            transitioned_after = 0;
                        }
                        else {
                            if (this.__sensor.motion) {
                                this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED, null, 1)));
                                this.exitSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected();
                                this.enterSequence_main_region_AutomaticMode_r1_MotionDetectionMode_r1_MotionDetected_default();
                                this.main_region_AutomaticMode_r1_MotionDetectionMode_react(0);
                                transitioned_after = 0;
                            }
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_AutomaticMode_r1_MotionDetectionMode_react(transitioned_before);
                    }
                    return transitioned_after;
                }
            }
            io.Statemachine = Statemachine;
            Statemachine["__class"] = "sct.yakindu.io.Statemachine";
            Statemachine["__interfaces"] = ["com.yakindu.core.IStatemachine", "com.yakindu.core.ITimed"];
            (function (Statemachine) {
                class User {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.on_button === undefined) {
                            this.on_button = false;
                        }
                        if (this.off_button === undefined) {
                            this.off_button = false;
                        }
                        if (this.mode_button === undefined) {
                            this.mode_button = false;
                        }
                        this.parent = parent;
                    }
                    raiseOn_button() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.on_button = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.USER_ON_BUTTON, null)));
                        this.parent.runCycle();
                    }
                    raiseOff_button() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.off_button = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.USER_OFF_BUTTON, null)));
                        this.parent.runCycle();
                    }
                    raiseMode_button() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.mode_button = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.USER_MODE_BUTTON, null)));
                        this.parent.runCycle();
                    }
                }
                Statemachine.User = User;
                User["__class"] = "sct.yakindu.io.Statemachine.User";
                class Sensor {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.motion === undefined) {
                            this.motion = false;
                        }
                        this.parent = parent;
                    }
                    raiseMotion() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.motion = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.SENSOR_MOTION, null)));
                        this.parent.runCycle();
                    }
                }
                Statemachine.Sensor = Sensor;
                Sensor["__class"] = "sct.yakindu.io.Statemachine.Sensor";
                class Lum_sensor {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.bright === undefined) {
                            this.bright = false;
                        }
                        if (this.dark === undefined) {
                            this.dark = false;
                        }
                        this.parent = parent;
                    }
                    raiseBright() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.bright = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.LUM_SENSOR_BRIGHT, null)));
                        this.parent.runCycle();
                    }
                    raiseDark() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.dark = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.LUM_SENSOR_DARK, null)));
                        this.parent.runCycle();
                    }
                }
                Statemachine.Lum_sensor = Lum_sensor;
                Lum_sensor["__class"] = "sct.yakindu.io.Statemachine.Lum_sensor";
                let State;
                (function (State) {
                    State[State["MAIN_REGION_MANUALMODE"] = 0] = "MAIN_REGION_MANUALMODE";
                    State[State["MAIN_REGION_AUTOMATICMODE"] = 1] = "MAIN_REGION_AUTOMATICMODE";
                    State[State["MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE"] = 2] = "MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE";
                    State[State["MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE"] = 3] = "MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_IDLE";
                    State[State["MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED"] = 4] = "MAIN_REGION_AUTOMATICMODE_R1_TWILIGHTDETECTIONMODE_R1_TWILIGHTDETECTED";
                    State[State["MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE"] = 5] = "MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE";
                    State[State["MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE"] = 6] = "MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_IDLE";
                    State[State["MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED"] = 7] = "MAIN_REGION_AUTOMATICMODE_R1_MOTIONDETECTIONMODE_R1_MOTIONDETECTED";
                    State[State["$NULLSTATE$"] = 8] = "$NULLSTATE$";
                })(State = Statemachine.State || (Statemachine.State = {}));
                /**
                 * Enumeration of all features of the statechart
                 * @enum
                 * @property {sct.yakindu.io.Statemachine.Feature} NO_FEATURE
                 * @property {sct.yakindu.io.Statemachine.Feature} INTERNAL_BRIGHTNESS
                 * @property {sct.yakindu.io.Statemachine.Feature} USER_ON_BUTTON
                 * @property {sct.yakindu.io.Statemachine.Feature} USER_OFF_BUTTON
                 * @property {sct.yakindu.io.Statemachine.Feature} USER_MODE_BUTTON
                 * @property {sct.yakindu.io.Statemachine.Feature} SENSOR_MOTION
                 * @property {sct.yakindu.io.Statemachine.Feature} LUM_SENSOR_BRIGHT
                 * @property {sct.yakindu.io.Statemachine.Feature} LUM_SENSOR_DARK
                 * @class
                 */
                let Feature;
                (function (Feature) {
                    Feature[Feature["NO_FEATURE"] = 0] = "NO_FEATURE";
                    Feature[Feature["INTERNAL_BRIGHTNESS"] = 1] = "INTERNAL_BRIGHTNESS";
                    Feature[Feature["USER_ON_BUTTON"] = 2] = "USER_ON_BUTTON";
                    Feature[Feature["USER_OFF_BUTTON"] = 3] = "USER_OFF_BUTTON";
                    Feature[Feature["USER_MODE_BUTTON"] = 4] = "USER_MODE_BUTTON";
                    Feature[Feature["SENSOR_MOTION"] = 5] = "SENSOR_MOTION";
                    Feature[Feature["LUM_SENSOR_BRIGHT"] = 6] = "LUM_SENSOR_BRIGHT";
                    Feature[Feature["LUM_SENSOR_DARK"] = 7] = "LUM_SENSOR_DARK";
                })(Feature = Statemachine.Feature || (Statemachine.Feature = {}));
            })(Statemachine = io.Statemachine || (io.Statemachine = {}));
        })(io = yakindu.io || (yakindu.io = {}));
    })(yakindu = sct.yakindu || (sct.yakindu = {}));
})(sct || (sct = {}));
