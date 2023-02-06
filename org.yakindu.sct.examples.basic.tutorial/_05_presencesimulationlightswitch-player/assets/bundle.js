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
                    if (this.__hmi === undefined) {
                        this.__hmi = null;
                    }
                    if (this.__simulation === undefined) {
                        this.__simulation = null;
                    }
                    this.historyVector = [null];
                    this.stateVector = [null, null];
                    this.trace = (new com.yakindu.core.rx.Observable());
                    if (this.timerService === undefined) {
                        this.timerService = null;
                    }
                    this.timeEvents = [false, false];
                    this.internalEventQueue = ([]);
                    this.inEventQueue = ([]);
                    if (this.changePresence === undefined) {
                        this.changePresence = false;
                    }
                    if (this.startSimulation === undefined) {
                        this.startSimulation = false;
                    }
                    if (this.stopSimulation === undefined) {
                        this.stopSimulation = false;
                    }
                    if (this.wait_time === undefined) {
                        this.wait_time = 0;
                    }
                    if (this.hour === undefined) {
                        this.hour = 0;
                    }
                    if (this.isExecuting === undefined) {
                        this.isExecuting = false;
                    }
                    if (this.stateConfVectorPosition === undefined) {
                        this.stateConfVectorPosition = 0;
                    }
                    if (this.internalOperationCallback === undefined) {
                        this.internalOperationCallback = null;
                    }
                    if (this.brightness === undefined) {
                        this.brightness = 0;
                    }
                    this.__hmi = new Statemachine.Hmi(this);
                    this.__simulation = new Statemachine.Simulation(this);
                    for (let i = 0; i < 2; i++) {
                        {
                            this.stateVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    for (let i = 0; i < 1; i++) {
                        {
                            this.historyVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    this.clearInEvents();
                    this.clearInternalEvents();
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                    this.__simulation.setWAIT_MIN(5);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.SIMULATION_WAIT_MIN, this.__simulation.wAIT_MIN)));
                    this.__simulation.setWAIT_MAX(1200);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.SIMULATION_WAIT_MAX, this.__simulation.wAIT_MAX)));
                    this.__simulation.setUPDATE_PERIOD(2);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.SIMULATION_UPDATE_PERIOD, this.__simulation.uPDATE_PERIOD)));
                    this.setWait_time(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_WAIT_TIME, this.wait_time)));
                    this.setHour(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_HOUR, this.hour)));
                    this.isExecuting = false;
                }
                getWait_time() {
                    return this.wait_time;
                }
                setWait_time(value) {
                    this.wait_time = value;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_WAIT_TIME, this.wait_time)));
                }
                getHour() {
                    return this.hour;
                }
                setHour(value) {
                    this.hour = value;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_HOUR, this.hour)));
                }
                getIsExecuting() {
                    return this.isExecuting;
                }
                setIsExecuting(value) {
                    this.isExecuting = value;
                }
                getStateConfVectorPosition() {
                    return this.stateConfVectorPosition;
                }
                setStateConfVectorPosition(value) {
                    this.stateConfVectorPosition = value;
                }
                enter() {
                    if (this.timerService == null) {
                        throw Object.defineProperty(new Error("Timer service must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
                    }
                    if (this.internalOperationCallback == null) {
                        throw Object.defineProperty(new Error("Internal operation callback must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
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
                    return this.stateVector[0] !== Statemachine.State.$NULLSTATE$ || this.stateVector[1] !== Statemachine.State.$NULLSTATE$;
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
                    this.__hmi.switchEvent = false;
                    this.__hmi.toggleMode = false;
                    this.__hmi.changeBrightness = false;
                    this.timeEvents[0] = false;
                    this.timeEvents[1] = false;
                }
                clearInternalEvents() {
                    this.changePresence = false;
                    this.startSimulation = false;
                    this.stopSimulation = false;
                }
                microStep() {
                    let transitioned = -1;
                    this.stateConfVectorPosition = 0;
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_IDLE:
                            transitioned = this.main_Presence_Simulation_mode_Idle_react(transitioned);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING:
                            transitioned = this.main_Presence_Simulation_mode_Active_schedule_Waiting_react(transitioned);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_MODE_OFF:
                            transitioned = this.main_Manual_mode_Off_react(transitioned);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_MODE_ON:
                            transitioned = this.main_Manual_mode_On_react(transitioned);
                            break;
                        default:
                            break;
                    }
                    if (this.getStateConfVectorPosition() < 1) {
                        switch ((this.stateVector[1])) {
                            case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT:
                                transitioned = this.main_Presence_Simulation_mode_Active_presence_Present_react(transitioned);
                                break;
                            case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT:
                                transitioned = this.main_Presence_Simulation_mode_Active_presence_Absent_react(transitioned);
                                break;
                            default:
                                break;
                        }
                    }
                }
                runCycle() {
                    if (this.timerService == null) {
                        throw Object.defineProperty(new Error("Timer service must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
                    }
                    if (this.internalOperationCallback == null) {
                        throw Object.defineProperty(new Error("Internal operation callback must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
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
                            this.clearInternalEvents();
                            this.nextEvent();
                        }
                    } while (((((((((this.__hmi.switchEvent || this.__hmi.toggleMode) || this.__hmi.changeBrightness) || this.changePresence) || this.startSimulation) || this.stopSimulation) || this.timeEvents[0]) || this.timeEvents[1])));
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_RTS_STOP, this)));
                    this.isExecuting = false;
                }
                nextEvent() {
                    if (!(this.internalEventQueue.length == 0)) {
                        (target => (typeof target === 'function') ? target() : target.run())(/* poll */ (a => a.length == 0 ? null : a.shift())(this.internalEventQueue));
                        return;
                    }
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
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_PRESENCE_SIMULATION]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT]];
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_IDLE:
                            return this.stateVector[0] === Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_IDLE;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT]];
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING:
                            return this.stateVector[0] === Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT:
                            return this.stateVector[1] === Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT:
                            return this.stateVector[1] === Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_MANUAL]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_MANUAL_MODE_ON]];
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_MODE_OFF:
                            return this.stateVector[0] === Statemachine.State.MAIN_MANUAL_MODE_OFF;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_MODE_ON:
                            return this.stateVector[0] === Statemachine.State.MAIN_MANUAL_MODE_ON;
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
                hmi() {
                    return this.__hmi;
                }
                simulation() {
                    return this.__simulation;
                }
                getTrace() {
                    return this.trace;
                }
                raiseChangePresence() {
                    /* add */ (this.internalEventQueue.push(() => {
                        this.changePresence = true;
                    }) > 0);
                }
                raiseStartSimulation() {
                    /* add */ (this.internalEventQueue.push(() => {
                        this.startSimulation = true;
                    }) > 0);
                }
                raiseStopSimulation() {
                    /* add */ (this.internalEventQueue.push(() => {
                        this.stopSimulation = true;
                    }) > 0);
                }
                setInternalOperationCallback(internalOperationCallback) {
                    this.internalOperationCallback = internalOperationCallback;
                }
                getBrightness() {
                    return this.brightness;
                }
                setBrightness(value) {
                    this.brightness = value;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_main_Presence_Simulation() {
                    this.timerService.setTimer(this, 0, (this.__simulation.getUPDATE_PERIOD() * 1000), true);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 0)));
                }
                entryAction_main_Presence_Simulation_mode_Idle() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_main_Presence_Simulation_mode_Active_schedule_Waiting() {
                    this.timerService.setTimer(this, 1, (this.getWait_time() * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 1)));
                    this.setWait_time(((n => n < 0 ? Math.ceil(n) : Math.floor(n))(((this.__simulation.wAIT_MIN + (this.internalOperationCallback.get_rand() * ((this.__simulation.wAIT_MAX - this.__simulation.wAIT_MIN))))))));
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_WAIT_TIME, this.wait_time)));
                }
                entryAction_main_Presence_Simulation_mode_Active_presence_Present() {
                    this.setBrightness(10);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_main_Presence_Simulation_mode_Active_presence_Absent() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_main_Manual_mode_Off() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                exitAction_main_Presence_Simulation() {
                    this.timerService.unsetTimer(this, 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 0)));
                }
                exitAction_main_Presence_Simulation_mode_Active_schedule_Waiting() {
                    this.timerService.unsetTimer(this, 1);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 1)));
                }
                enterSequence_main_Presence_Simulation_default() {
                    this.entryAction_main_Presence_Simulation();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION, null, null)));
                    this.enterSequence_main_Presence_Simulation_mode_default();
                }
                enterSequence_main_Presence_Simulation_mode_Idle_default() {
                    this.entryAction_main_Presence_Simulation_mode_Idle();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_IDLE, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_IDLE;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_main_Presence_Simulation_mode_Active_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE, null, null)));
                    this.enterSequence_main_Presence_Simulation_mode_Active_schedule_default();
                    this.enterSequence_main_Presence_Simulation_mode_Active_presence_default();
                }
                enterSequence_main_Presence_Simulation_mode_Active_schedule_Waiting_default() {
                    this.entryAction_main_Presence_Simulation_mode_Active_schedule_Waiting();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_main_Presence_Simulation_mode_Active_presence_Present_default() {
                    this.entryAction_main_Presence_Simulation_mode_Active_presence_Present();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT, null, null)));
                    this.stateVector[1] = Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT;
                    this.stateConfVectorPosition = 1;
                    this.historyVector[0] = this.stateVector[1];
                }
                enterSequence_main_Presence_Simulation_mode_Active_presence_Absent_default() {
                    this.entryAction_main_Presence_Simulation_mode_Active_presence_Absent();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT, null, null)));
                    this.stateVector[1] = Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT;
                    this.stateConfVectorPosition = 1;
                    this.historyVector[0] = this.stateVector[1];
                }
                enterSequence_main_Manual_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_MANUAL, null, null)));
                    this.enterSequence_main_Manual_mode_default();
                }
                enterSequence_main_Manual_mode_Off_default() {
                    this.entryAction_main_Manual_mode_Off();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_MANUAL_MODE_OFF, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_MANUAL_MODE_OFF;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_main_Manual_mode_On_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_MANUAL_MODE_ON, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_MANUAL_MODE_ON;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_main_default() {
                    this.react_main__entry_Default();
                }
                enterSequence_main_Presence_Simulation_mode_default() {
                    this.react_main_Presence_Simulation_mode__entry_Default();
                }
                enterSequence_main_Presence_Simulation_mode_Active_schedule_default() {
                    this.react_main_Presence_Simulation_mode_Active_schedule__entry_Default();
                }
                enterSequence_main_Presence_Simulation_mode_Active_presence_default() {
                    this.react_main_Presence_Simulation_mode_Active_presence__entry_Default();
                }
                shallowEnterSequence_main_Presence_Simulation_mode_Active_presence() {
                    switch ((this.historyVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT:
                            this.enterSequence_main_Presence_Simulation_mode_Active_presence_Present_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT:
                            this.enterSequence_main_Presence_Simulation_mode_Active_presence_Absent_default();
                            break;
                        default:
                            break;
                    }
                }
                enterSequence_main_Manual_mode_default() {
                    this.react_main_Manual_mode__entry_Default();
                }
                exitSequence_main_Presence_Simulation() {
                    this.exitSequence_main_Presence_Simulation_mode();
                    this.exitAction_main_Presence_Simulation();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION, null, null)));
                }
                exitSequence_main_Presence_Simulation_mode_Idle() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_IDLE, null, null)));
                }
                exitSequence_main_Presence_Simulation_mode_Active() {
                    this.exitSequence_main_Presence_Simulation_mode_Active_schedule();
                    this.exitSequence_main_Presence_Simulation_mode_Active_presence();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE, null, null)));
                }
                exitSequence_main_Presence_Simulation_mode_Active_schedule_Waiting() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.exitAction_main_Presence_Simulation_mode_Active_schedule_Waiting();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING, null, null)));
                }
                exitSequence_main_Presence_Simulation_mode_Active_presence_Present() {
                    this.stateVector[1] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 1;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT, null, null)));
                }
                exitSequence_main_Presence_Simulation_mode_Active_presence_Absent() {
                    this.stateVector[1] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 1;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT, null, null)));
                }
                exitSequence_main_Manual() {
                    this.exitSequence_main_Manual_mode();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL, null, null)));
                }
                exitSequence_main_Manual_mode_Off() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL_MODE_OFF, null, null)));
                }
                exitSequence_main_Manual_mode_On() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL_MODE_ON, null, null)));
                }
                exitSequence_main() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_IDLE:
                            this.exitSequence_main_Presence_Simulation_mode_Idle();
                            this.exitAction_main_Presence_Simulation();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING:
                            this.exitSequence_main_Presence_Simulation_mode_Active_schedule_Waiting();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_MODE_OFF:
                            this.exitSequence_main_Manual_mode_Off();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_MODE_ON:
                            this.exitSequence_main_Manual_mode_On();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_MANUAL, null, null)));
                            break;
                        default:
                            break;
                    }
                    switch ((this.stateVector[1])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT:
                            this.exitSequence_main_Presence_Simulation_mode_Active_presence_Present();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE, null, null)));
                            this.exitAction_main_Presence_Simulation();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT:
                            this.exitSequence_main_Presence_Simulation_mode_Active_presence_Absent();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE, null, null)));
                            this.exitAction_main_Presence_Simulation();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION, null, null)));
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_Presence_Simulation_mode() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_IDLE:
                            this.exitSequence_main_Presence_Simulation_mode_Idle();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING:
                            this.exitSequence_main_Presence_Simulation_mode_Active_schedule_Waiting();
                            break;
                        default:
                            break;
                    }
                    switch ((this.stateVector[1])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT:
                            this.exitSequence_main_Presence_Simulation_mode_Active_presence_Present();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT:
                            this.exitSequence_main_Presence_Simulation_mode_Active_presence_Absent();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE, null, null)));
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_Presence_Simulation_mode_Active_schedule() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING:
                            this.exitSequence_main_Presence_Simulation_mode_Active_schedule_Waiting();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_Presence_Simulation_mode_Active_presence() {
                    switch ((this.stateVector[1])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT:
                            this.exitSequence_main_Presence_Simulation_mode_Active_presence_Present();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT:
                            this.exitSequence_main_Presence_Simulation_mode_Active_presence_Absent();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_Manual_mode() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_MODE_OFF:
                            this.exitSequence_main_Manual_mode_Off();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_MANUAL_MODE_ON:
                            this.exitSequence_main_Manual_mode_On();
                            break;
                        default:
                            break;
                    }
                }
                react_main_Presence_Simulation_mode_Active_schedule__entry_Default() {
                    this.enterSequence_main_Presence_Simulation_mode_Active_schedule_Waiting_default();
                }
                react_main_Presence_Simulation_mode_Active_presence__entry_Default() {
                    if (this.historyVector[0] !== Statemachine.State.$NULLSTATE$) {
                        this.shallowEnterSequence_main_Presence_Simulation_mode_Active_presence();
                    }
                    else {
                        this.enterSequence_main_Presence_Simulation_mode_Active_presence_Absent_default();
                    }
                }
                react_main_Presence_Simulation_mode__entry_Default() {
                    this.enterSequence_main_Presence_Simulation_mode_Idle_default();
                }
                react_main_Manual_mode__entry_Default() {
                    this.enterSequence_main_Manual_mode_Off_default();
                }
                react_main__entry_Default() {
                    this.enterSequence_main_Manual_default();
                }
                react(transitioned_before) {
                    return transitioned_before;
                }
                main_Presence_Simulation_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.toggleMode) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_PRESENCE_SIMULATION, null, 0)));
                            this.exitSequence_main_Presence_Simulation();
                            this.enterSequence_main_Manual_default();
                            this.react(0);
                            transitioned_after = 1;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        if (this.timeEvents[0]) {
                            this.setHour(this.internalOperationCallback.get_hour());
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.INTERNAL_HOUR, this.hour)));
                        }
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Presence_Simulation_mode_Idle_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.startSimulation) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_IDLE, null, 0)));
                            this.exitSequence_main_Presence_Simulation_mode_Idle();
                            this.enterSequence_main_Presence_Simulation_mode_Active_default();
                            this.main_Presence_Simulation_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        if ((this.getHour() > 17 || ((this.getHour() > 7 && this.getHour() < 10)))) {
                            this.raiseStartSimulation();
                        }
                        transitioned_after = this.main_Presence_Simulation_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Presence_Simulation_mode_Active_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.stopSimulation) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE, null, 0)));
                            this.exitSequence_main_Presence_Simulation_mode_Active();
                            this.enterSequence_main_Presence_Simulation_mode_Idle_default();
                            this.main_Presence_Simulation_react(0);
                            transitioned_after = 1;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_Presence_Simulation_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Presence_Simulation_mode_Active_schedule_Waiting_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.changePresence) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING, null, 0)));
                            this.exitSequence_main_Presence_Simulation_mode_Active_schedule_Waiting();
                            this.enterSequence_main_Presence_Simulation_mode_Active_schedule_Waiting_default();
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        if (!((this.getHour() > 17 || ((this.getHour() > 7 && this.getHour() < 10))))) {
                            this.raiseStopSimulation();
                        }
                        if (this.timeEvents[1]) {
                            this.raiseChangePresence();
                        }
                    }
                    return transitioned_after;
                }
                main_Presence_Simulation_mode_Active_presence_Present_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 1) {
                        if (this.changePresence) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT, null, 0)));
                            this.exitSequence_main_Presence_Simulation_mode_Active_presence_Present();
                            this.enterSequence_main_Presence_Simulation_mode_Active_presence_Absent_default();
                            this.main_Presence_Simulation_mode_Active_react(0);
                            transitioned_after = 1;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_Presence_Simulation_mode_Active_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Presence_Simulation_mode_Active_presence_Absent_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 1) {
                        if (this.changePresence) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT, null, 0)));
                            this.exitSequence_main_Presence_Simulation_mode_Active_presence_Absent();
                            this.enterSequence_main_Presence_Simulation_mode_Active_presence_Present_default();
                            this.main_Presence_Simulation_mode_Active_react(0);
                            transitioned_after = 1;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_Presence_Simulation_mode_Active_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Manual_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.toggleMode) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MANUAL, null, 0)));
                            this.exitSequence_main_Manual();
                            this.enterSequence_main_Presence_Simulation_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Manual_mode_Off_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.switchEvent) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MANUAL_MODE_OFF, null, 0)));
                            this.exitSequence_main_Manual_mode_Off();
                            this.setBrightness(10);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                            this.enterSequence_main_Manual_mode_On_default();
                            this.main_Manual_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_Manual_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_Manual_mode_On_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.switchEvent) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_MANUAL_MODE_ON, null, 0)));
                            this.exitSequence_main_Manual_mode_On();
                            this.enterSequence_main_Manual_mode_Off_default();
                            this.main_Manual_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        if (((this.__hmi.changeBrightness) && (this.getBrightness() > 1))) {
                            this.setBrightness(this.getBrightness() - 1);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                        }
                        if (((this.__hmi.changeBrightness) && (this.getBrightness() <= 1))) {
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
                class Hmi {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.switchEvent === undefined) {
                            this.switchEvent = false;
                        }
                        if (this.toggleMode === undefined) {
                            this.toggleMode = false;
                        }
                        if (this.changeBrightness === undefined) {
                            this.changeBrightness = false;
                        }
                        this.parent = parent;
                    }
                    raiseSwitch() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.switchEvent = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.HMI_SWITCH, null)));
                        this.parent.runCycle();
                    }
                    raiseToggleMode() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.toggleMode = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.HMI_TOGGLEMODE, null)));
                        this.parent.runCycle();
                    }
                    raiseChangeBrightness() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.changeBrightness = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.HMI_CHANGEBRIGHTNESS, null)));
                        this.parent.runCycle();
                    }
                }
                Statemachine.Hmi = Hmi;
                Hmi["__class"] = "sct.yakindu.io.Statemachine.Hmi";
                class Simulation {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.wAIT_MIN === undefined) {
                            this.wAIT_MIN = 0;
                        }
                        if (this.wAIT_MAX === undefined) {
                            this.wAIT_MAX = 0;
                        }
                        if (this.uPDATE_PERIOD === undefined) {
                            this.uPDATE_PERIOD = 0;
                        }
                        this.parent = parent;
                    }
                    getWAIT_MIN() {
                        return this.wAIT_MIN;
                    }
                    setWAIT_MIN(value) {
                        this.wAIT_MIN = value;
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this.parent, null, Statemachine.Feature.SIMULATION_WAIT_MIN, this.wAIT_MIN)));
                    }
                    getWAIT_MAX() {
                        return this.wAIT_MAX;
                    }
                    setWAIT_MAX(value) {
                        this.wAIT_MAX = value;
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this.parent, null, Statemachine.Feature.SIMULATION_WAIT_MAX, this.wAIT_MAX)));
                    }
                    getUPDATE_PERIOD() {
                        return this.uPDATE_PERIOD;
                    }
                    setUPDATE_PERIOD(value) {
                        this.uPDATE_PERIOD = value;
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this.parent, null, Statemachine.Feature.SIMULATION_UPDATE_PERIOD, this.uPDATE_PERIOD)));
                    }
                }
                Statemachine.Simulation = Simulation;
                Simulation["__class"] = "sct.yakindu.io.Statemachine.Simulation";
                let State;
                (function (State) {
                    State[State["MAIN_PRESENCE_SIMULATION"] = 0] = "MAIN_PRESENCE_SIMULATION";
                    State[State["MAIN_PRESENCE_SIMULATION_MODE_IDLE"] = 1] = "MAIN_PRESENCE_SIMULATION_MODE_IDLE";
                    State[State["MAIN_PRESENCE_SIMULATION_MODE_ACTIVE"] = 2] = "MAIN_PRESENCE_SIMULATION_MODE_ACTIVE";
                    State[State["MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING"] = 3] = "MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_SCHEDULE_WAITING";
                    State[State["MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT"] = 4] = "MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_PRESENT";
                    State[State["MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT"] = 5] = "MAIN_PRESENCE_SIMULATION_MODE_ACTIVE_PRESENCE_ABSENT";
                    State[State["MAIN_MANUAL"] = 6] = "MAIN_MANUAL";
                    State[State["MAIN_MANUAL_MODE_OFF"] = 7] = "MAIN_MANUAL_MODE_OFF";
                    State[State["MAIN_MANUAL_MODE_ON"] = 8] = "MAIN_MANUAL_MODE_ON";
                    State[State["$NULLSTATE$"] = 9] = "$NULLSTATE$";
                })(State = Statemachine.State || (Statemachine.State = {}));
                /**
                 * Enumeration of all features of the statechart
                 * @enum
                 * @property {sct.yakindu.io.Statemachine.Feature} NO_FEATURE
                 * @property {sct.yakindu.io.Statemachine.Feature} BRIGHTNESS
                 * @property {sct.yakindu.io.Statemachine.Feature} HMI_SWITCH
                 * @property {sct.yakindu.io.Statemachine.Feature} HMI_TOGGLEMODE
                 * @property {sct.yakindu.io.Statemachine.Feature} HMI_CHANGEBRIGHTNESS
                 * @property {sct.yakindu.io.Statemachine.Feature} SIMULATION_WAIT_MIN
                 * @property {sct.yakindu.io.Statemachine.Feature} SIMULATION_WAIT_MAX
                 * @property {sct.yakindu.io.Statemachine.Feature} SIMULATION_UPDATE_PERIOD
                 * @property {sct.yakindu.io.Statemachine.Feature} INTERNAL_WAIT_TIME
                 * @property {sct.yakindu.io.Statemachine.Feature} INTERNAL_HOUR
                 * @property {sct.yakindu.io.Statemachine.Feature} INTERNAL_CHANGEPRESENCE
                 * @property {sct.yakindu.io.Statemachine.Feature} INTERNAL_STARTSIMULATION
                 * @property {sct.yakindu.io.Statemachine.Feature} INTERNAL_STOPSIMULATION
                 * @class
                 */
                let Feature;
                (function (Feature) {
                    Feature[Feature["NO_FEATURE"] = 0] = "NO_FEATURE";
                    Feature[Feature["BRIGHTNESS"] = 1] = "BRIGHTNESS";
                    Feature[Feature["HMI_SWITCH"] = 2] = "HMI_SWITCH";
                    Feature[Feature["HMI_TOGGLEMODE"] = 3] = "HMI_TOGGLEMODE";
                    Feature[Feature["HMI_CHANGEBRIGHTNESS"] = 4] = "HMI_CHANGEBRIGHTNESS";
                    Feature[Feature["SIMULATION_WAIT_MIN"] = 5] = "SIMULATION_WAIT_MIN";
                    Feature[Feature["SIMULATION_WAIT_MAX"] = 6] = "SIMULATION_WAIT_MAX";
                    Feature[Feature["SIMULATION_UPDATE_PERIOD"] = 7] = "SIMULATION_UPDATE_PERIOD";
                    Feature[Feature["INTERNAL_WAIT_TIME"] = 8] = "INTERNAL_WAIT_TIME";
                    Feature[Feature["INTERNAL_HOUR"] = 9] = "INTERNAL_HOUR";
                    Feature[Feature["INTERNAL_CHANGEPRESENCE"] = 10] = "INTERNAL_CHANGEPRESENCE";
                    Feature[Feature["INTERNAL_STARTSIMULATION"] = 11] = "INTERNAL_STARTSIMULATION";
                    Feature[Feature["INTERNAL_STOPSIMULATION"] = 12] = "INTERNAL_STOPSIMULATION";
                })(Feature = Statemachine.Feature || (Statemachine.Feature = {}));
            })(Statemachine = io.Statemachine || (io.Statemachine = {}));
        })(io = yakindu.io || (yakindu.io = {}));
    })(yakindu = sct.yakindu || (sct.yakindu = {}));
})(sct || (sct = {}));
