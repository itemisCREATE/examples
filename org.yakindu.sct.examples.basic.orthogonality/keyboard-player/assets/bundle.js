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
                    this.stateVector = [null, null];
                    this.trace = (new com.yakindu.core.rx.Observable());
                    this.inEventQueue = ([]);
                    if (this.isExecuting === undefined) {
                        this.isExecuting = false;
                    }
                    if (this.stateConfVectorPosition === undefined) {
                        this.stateConfVectorPosition = 0;
                    }
                    if (this.pressCapsLock === undefined) {
                        this.pressCapsLock = false;
                    }
                    if (this.pressNumLock === undefined) {
                        this.pressNumLock = false;
                    }
                    for (let i = 0; i < 2; i++) {
                        {
                            this.stateVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    this.clearInEvents();
                    this.isExecuting = false;
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
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_ENTER, this)));
                    this.enterSequence_CapsLock_default();
                    this.enterSequence_NumLock_default();
                    this.isExecuting = false;
                }
                exit() {
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_EXIT, this)));
                    this.exitSequence_CapsLock();
                    this.exitSequence_NumLock();
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
                    this.pressCapsLock = false;
                    this.pressNumLock = false;
                }
                microStep() {
                    let transitioned = -1;
                    this.stateConfVectorPosition = 0;
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.CAPSLOCK_CAPSLOCK_OFF:
                            transitioned = this.capsLock_CapsLock_OFF_react(transitioned);
                            break;
                        case sct.yakindu.io.Statemachine.State.CAPSLOCK_CAPSLOCK_ON:
                            transitioned = this.capsLock_CapsLock_ON_react(transitioned);
                            break;
                        default:
                            break;
                    }
                    if (this.getStateConfVectorPosition() < 1) {
                        switch ((this.stateVector[1])) {
                            case sct.yakindu.io.Statemachine.State.NUMLOCK_NUMLOCK_OFF:
                                transitioned = this.numLock_NumLock_OFF_react(transitioned);
                                break;
                            case sct.yakindu.io.Statemachine.State.NUMLOCK_NUMLOCK_ON:
                                transitioned = this.numLock_NumLock_ON_react(transitioned);
                                break;
                            default:
                                break;
                        }
                    }
                }
                runCycle() {
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
                    } while (((this.pressCapsLock || this.pressNumLock)));
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
                        case sct.yakindu.io.Statemachine.State.CAPSLOCK_CAPSLOCK_OFF:
                            return this.stateVector[0] === Statemachine.State.CAPSLOCK_CAPSLOCK_OFF;
                        case sct.yakindu.io.Statemachine.State.CAPSLOCK_CAPSLOCK_ON:
                            return this.stateVector[0] === Statemachine.State.CAPSLOCK_CAPSLOCK_ON;
                        case sct.yakindu.io.Statemachine.State.NUMLOCK_NUMLOCK_OFF:
                            return this.stateVector[1] === Statemachine.State.NUMLOCK_NUMLOCK_OFF;
                        case sct.yakindu.io.Statemachine.State.NUMLOCK_NUMLOCK_ON:
                            return this.stateVector[1] === Statemachine.State.NUMLOCK_NUMLOCK_ON;
                        default:
                            return false;
                    }
                }
                getTrace() {
                    return this.trace;
                }
                raisePressCapsLock() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.pressCapsLock = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.PRESSCAPSLOCK, null)));
                    this.runCycle();
                }
                raisePressNumLock() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.pressNumLock = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.PRESSNUMLOCK, null)));
                    this.runCycle();
                }
                enterSequence_CapsLock_CapsLock_OFF_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.CAPSLOCK_CAPSLOCK_OFF, null, null)));
                    this.stateVector[0] = Statemachine.State.CAPSLOCK_CAPSLOCK_OFF;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_CapsLock_CapsLock_ON_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.CAPSLOCK_CAPSLOCK_ON, null, null)));
                    this.stateVector[0] = Statemachine.State.CAPSLOCK_CAPSLOCK_ON;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_NumLock_NumLock_OFF_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.NUMLOCK_NUMLOCK_OFF, null, null)));
                    this.stateVector[1] = Statemachine.State.NUMLOCK_NUMLOCK_OFF;
                    this.stateConfVectorPosition = 1;
                }
                enterSequence_NumLock_NumLock_ON_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.NUMLOCK_NUMLOCK_ON, null, null)));
                    this.stateVector[1] = Statemachine.State.NUMLOCK_NUMLOCK_ON;
                    this.stateConfVectorPosition = 1;
                }
                enterSequence_CapsLock_default() {
                    this.react_CapsLock__entry_Default();
                }
                enterSequence_NumLock_default() {
                    this.react_NumLock__entry_Default();
                }
                exitSequence_CapsLock_CapsLock_OFF() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.CAPSLOCK_CAPSLOCK_OFF, null, null)));
                }
                exitSequence_CapsLock_CapsLock_ON() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.CAPSLOCK_CAPSLOCK_ON, null, null)));
                }
                exitSequence_NumLock_NumLock_OFF() {
                    this.stateVector[1] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 1;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.NUMLOCK_NUMLOCK_OFF, null, null)));
                }
                exitSequence_NumLock_NumLock_ON() {
                    this.stateVector[1] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 1;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.NUMLOCK_NUMLOCK_ON, null, null)));
                }
                exitSequence_CapsLock() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.CAPSLOCK_CAPSLOCK_OFF:
                            this.exitSequence_CapsLock_CapsLock_OFF();
                            break;
                        case sct.yakindu.io.Statemachine.State.CAPSLOCK_CAPSLOCK_ON:
                            this.exitSequence_CapsLock_CapsLock_ON();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_NumLock() {
                    switch ((this.stateVector[1])) {
                        case sct.yakindu.io.Statemachine.State.NUMLOCK_NUMLOCK_OFF:
                            this.exitSequence_NumLock_NumLock_OFF();
                            break;
                        case sct.yakindu.io.Statemachine.State.NUMLOCK_NUMLOCK_ON:
                            this.exitSequence_NumLock_NumLock_ON();
                            break;
                        default:
                            break;
                    }
                }
                react_CapsLock__entry_Default() {
                    this.enterSequence_CapsLock_CapsLock_OFF_default();
                }
                react_NumLock__entry_Default() {
                    this.enterSequence_NumLock_NumLock_OFF_default();
                }
                react(transitioned_before) {
                    return transitioned_before;
                }
                capsLock_CapsLock_OFF_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.pressCapsLock) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.CAPSLOCK_CAPSLOCK_OFF, null, 0)));
                            this.exitSequence_CapsLock_CapsLock_OFF();
                            this.enterSequence_CapsLock_CapsLock_ON_default();
                            transitioned_after = 0;
                        }
                    }
                    return transitioned_after;
                }
                capsLock_CapsLock_ON_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.pressCapsLock) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.CAPSLOCK_CAPSLOCK_ON, null, 0)));
                            this.exitSequence_CapsLock_CapsLock_ON();
                            this.enterSequence_CapsLock_CapsLock_OFF_default();
                            transitioned_after = 0;
                        }
                    }
                    return transitioned_after;
                }
                numLock_NumLock_OFF_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 1) {
                        if (this.pressNumLock) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.NUMLOCK_NUMLOCK_OFF, null, 0)));
                            this.exitSequence_NumLock_NumLock_OFF();
                            this.enterSequence_NumLock_NumLock_ON_default();
                            this.react(0);
                            transitioned_after = 1;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                numLock_NumLock_ON_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 1) {
                        if (this.pressNumLock) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.NUMLOCK_NUMLOCK_ON, null, 0)));
                            this.exitSequence_NumLock_NumLock_ON();
                            this.enterSequence_NumLock_NumLock_OFF_default();
                            this.react(0);
                            transitioned_after = 1;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
            }
            io.Statemachine = Statemachine;
            Statemachine["__class"] = "sct.yakindu.io.Statemachine";
            Statemachine["__interfaces"] = ["com.yakindu.core.IStatemachine"];
            (function (Statemachine) {
                let State;
                (function (State) {
                    State[State["CAPSLOCK_CAPSLOCK_OFF"] = 0] = "CAPSLOCK_CAPSLOCK_OFF";
                    State[State["CAPSLOCK_CAPSLOCK_ON"] = 1] = "CAPSLOCK_CAPSLOCK_ON";
                    State[State["NUMLOCK_NUMLOCK_OFF"] = 2] = "NUMLOCK_NUMLOCK_OFF";
                    State[State["NUMLOCK_NUMLOCK_ON"] = 3] = "NUMLOCK_NUMLOCK_ON";
                    State[State["$NULLSTATE$"] = 4] = "$NULLSTATE$";
                })(State = Statemachine.State || (Statemachine.State = {}));
                /**
                 * Enumeration of all features of the statechart
                 * @enum
                 * @property {sct.yakindu.io.Statemachine.Feature} NO_FEATURE
                 * @property {sct.yakindu.io.Statemachine.Feature} PRESSCAPSLOCK
                 * @property {sct.yakindu.io.Statemachine.Feature} PRESSNUMLOCK
                 * @class
                 */
                let Feature;
                (function (Feature) {
                    Feature[Feature["NO_FEATURE"] = 0] = "NO_FEATURE";
                    Feature[Feature["PRESSCAPSLOCK"] = 1] = "PRESSCAPSLOCK";
                    Feature[Feature["PRESSNUMLOCK"] = 2] = "PRESSNUMLOCK";
                })(Feature = Statemachine.Feature || (Statemachine.Feature = {}));
            })(Statemachine = io.Statemachine || (io.Statemachine = {}));
        })(io = yakindu.io || (yakindu.io = {}));
    })(yakindu = sct.yakindu || (sct.yakindu = {}));
})(sct || (sct = {}));
