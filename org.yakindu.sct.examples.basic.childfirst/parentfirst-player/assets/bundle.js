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
                    this.inEventQueue = ([]);
                    if (this.isExecuting === undefined) {
                        this.isExecuting = false;
                    }
                    if (this.e === undefined) {
                        this.e = false;
                    }
                    if (this.m === undefined) {
                        this.m = 0;
                    }
                    if (this.n === undefined) {
                        this.n = 0;
                    }
                    if (this.o === undefined) {
                        this.o = 0;
                    }
                    for (let i = 0; i < 1; i++) {
                        {
                            this.stateVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    this.clearInEvents();
                    this.setM(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.M, this.m)));
                    this.setN(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.N, this.n)));
                    this.setO(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.O, this.o)));
                    this.isExecuting = false;
                }
                getIsExecuting() {
                    return this.isExecuting;
                }
                setIsExecuting(value) {
                    this.isExecuting = value;
                }
                enter() {
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
                    this.e = false;
                }
                microStep() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_A_R1_B:
                            this.main_region_A_r1_B_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_A_R1_C:
                            this.main_region_A_r1_C_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_D:
                            this.main_region_D_react(-1);
                            break;
                        default:
                            break;
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
                    } while ((this.e));
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
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_A:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_A]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_A_R1_C]];
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_A_R1_B:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_A_R1_B;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_A_R1_C:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_A_R1_C;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_D:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_D;
                        default:
                            return false;
                    }
                }
                getTrace() {
                    return this.trace;
                }
                raiseE() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.e = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.E, null)));
                    this.runCycle();
                }
                getM() {
                    return this.m;
                }
                setM(value) {
                    this.m = value;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.M, this.m)));
                }
                getN() {
                    return this.n;
                }
                setN(value) {
                    this.n = value;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.N, this.n)));
                }
                getO() {
                    return this.o;
                }
                setO(value) {
                    this.o = value;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.O, this.o)));
                }
                entryAction_main_region_A() {
                    this.setM(1);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.M, this.m)));
                }
                entryAction_main_region_A_r1_B() {
                    this.setM(2);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.M, this.m)));
                }
                exitAction_main_region_A() {
                    this.setO(1);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.O, this.o)));
                }
                exitAction_main_region_A_r1_B() {
                    this.setO(2);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.O, this.o)));
                }
                enterSequence_main_region_A_default() {
                    this.entryAction_main_region_A();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_A, null, null)));
                    this.enterSequence_main_region_A_r1_default();
                }
                enterSequence_main_region_A_r1_B_default() {
                    this.entryAction_main_region_A_r1_B();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_A_R1_B, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_A_R1_B;
                }
                enterSequence_main_region_A_r1_C_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_A_R1_C, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_A_R1_C;
                }
                enterSequence_main_region_D_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_D, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_D;
                }
                enterSequence_main_region_default() {
                    this.react_main_region__entry_Default();
                }
                enterSequence_main_region_A_r1_default() {
                    this.react_main_region_A_r1__entry_Default();
                }
                exitSequence_main_region_A() {
                    this.exitSequence_main_region_A_r1();
                    this.exitAction_main_region_A();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_A, null, null)));
                }
                exitSequence_main_region_A_r1_B() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_main_region_A_r1_B();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_A_R1_B, null, null)));
                }
                exitSequence_main_region_A_r1_C() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_A_R1_C, null, null)));
                }
                exitSequence_main_region_D() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_D, null, null)));
                }
                exitSequence_main_region() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_A_R1_B:
                            this.exitSequence_main_region_A_r1_B();
                            this.exitAction_main_region_A();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_A, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_A_R1_C:
                            this.exitSequence_main_region_A_r1_C();
                            this.exitAction_main_region_A();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_A, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_D:
                            this.exitSequence_main_region_D();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_A_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_A_R1_B:
                            this.exitSequence_main_region_A_r1_B();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_A_R1_C:
                            this.exitSequence_main_region_A_r1_C();
                            break;
                        default:
                            break;
                    }
                }
                react_main_region_A_r1__entry_Default() {
                    this.enterSequence_main_region_A_r1_B_default();
                }
                react_main_region__entry_Default() {
                    this.enterSequence_main_region_A_default();
                }
                react(transitioned_before) {
                    return transitioned_before;
                }
                main_region_A_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.e) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_A, null, 0)));
                            this.exitSequence_main_region_A();
                            this.enterSequence_main_region_D_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        if (this.e) {
                            this.setN(1);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.N, this.n)));
                        }
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_A_r1_B_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.e) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_A_R1_B, null, 0)));
                            this.exitSequence_main_region_A_r1_B();
                            this.enterSequence_main_region_A_r1_C_default();
                            this.main_region_A_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        if (this.e) {
                            this.setN(2);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.N, this.n)));
                        }
                        transitioned_after = this.main_region_A_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_A_r1_C_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_A_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_D_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
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
                    State[State["MAIN_REGION_A"] = 0] = "MAIN_REGION_A";
                    State[State["MAIN_REGION_A_R1_B"] = 1] = "MAIN_REGION_A_R1_B";
                    State[State["MAIN_REGION_A_R1_C"] = 2] = "MAIN_REGION_A_R1_C";
                    State[State["MAIN_REGION_D"] = 3] = "MAIN_REGION_D";
                    State[State["$NULLSTATE$"] = 4] = "$NULLSTATE$";
                })(State = Statemachine.State || (Statemachine.State = {}));
                /**
                 * Enumeration of all features of the statechart
                 * @enum
                 * @property {sct.yakindu.io.Statemachine.Feature} NO_FEATURE
                 * @property {sct.yakindu.io.Statemachine.Feature} E
                 * @property {sct.yakindu.io.Statemachine.Feature} M
                 * @property {sct.yakindu.io.Statemachine.Feature} N
                 * @property {sct.yakindu.io.Statemachine.Feature} O
                 * @class
                 */
                let Feature;
                (function (Feature) {
                    Feature[Feature["NO_FEATURE"] = 0] = "NO_FEATURE";
                    Feature[Feature["E"] = 1] = "E";
                    Feature[Feature["M"] = 2] = "M";
                    Feature[Feature["N"] = 3] = "N";
                    Feature[Feature["O"] = 4] = "O";
                })(Feature = Statemachine.Feature || (Statemachine.Feature = {}));
            })(Statemachine = io.Statemachine || (io.Statemachine = {}));
        })(io = yakindu.io || (yakindu.io = {}));
    })(yakindu = sct.yakindu || (sct.yakindu = {}));
})(sct || (sct = {}));
