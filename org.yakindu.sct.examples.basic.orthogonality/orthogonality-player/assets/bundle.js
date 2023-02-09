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
                    if (this.proceed === undefined) {
                        this.proceed = false;
                    }
                    if (this.pa === undefined) {
                        this.pa = false;
                    }
                    if (this.pb === undefined) {
                        this.pb = false;
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
                    return this.stateVector[0] !== Statemachine.State.$NULLSTATE$ || this.stateVector[1] !== Statemachine.State.$NULLSTATE$;
                }
                /**
                 *
                 * @see IStatemachine#isFinal()
                 * @return {boolean}
                 */
                isFinal() {
                    return (this.stateVector[0] === Statemachine.State.MAIN_REGION__FINAL_) && (this.stateVector[1] === Statemachine.State.$NULLSTATE$);
                }
                clearInEvents() {
                    this.proceed = false;
                    this.pa = false;
                    this.pb = false;
                }
                microStep() {
                    let transitioned = -1;
                    this.stateConfVectorPosition = 0;
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_1:
                            transitioned = this.main_region_Process_r1_Line_A_1_react(transitioned);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2:
                            transitioned = this.main_region_Process_r1_Line_A_2_react(transitioned);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_INITIALIZE:
                            transitioned = this.main_region_Initialize_react(transitioned);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_CLEANUP:
                            transitioned = this.main_region_Cleanup_react(transitioned);
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION__FINAL_:
                            transitioned = this.main_region__final__react(transitioned);
                            break;
                        default:
                            break;
                    }
                    if (this.getStateConfVectorPosition() < 1) {
                        switch ((this.stateVector[1])) {
                            case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_1:
                                transitioned = this.main_region_Process_r2_Line_B_1_react(transitioned);
                                break;
                            case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2:
                                transitioned = this.main_region_Process_r2_Line_B_2_react(transitioned);
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
                    } while ((((this.proceed || this.pa) || this.pb)));
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
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_PROCESS]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2]];
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_1:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_1;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_1:
                            return this.stateVector[1] === Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_1;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2:
                            return this.stateVector[1] === Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_INITIALIZE:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_INITIALIZE;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_CLEANUP:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION_CLEANUP;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION__FINAL_:
                            return this.stateVector[0] === Statemachine.State.MAIN_REGION__FINAL_;
                        default:
                            return false;
                    }
                }
                getTrace() {
                    return this.trace;
                }
                raiseProceed() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.proceed = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.PROCEED, null)));
                    this.runCycle();
                }
                raisePa() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.pa = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.PA, null)));
                    this.runCycle();
                }
                raisePb() {
                    /* add */ (this.inEventQueue.push(() => {
                        this.pb = true;
                    }) > 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this, null, Statemachine.Feature.PB, null)));
                    this.runCycle();
                }
                enterSequence_main_region_Process_r1_Line_A_1_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_1, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_1;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_main_region_Process_r1_Line_A_2_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_main_region_Process_r2_Line_B_1_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_1, null, null)));
                    this.stateVector[1] = Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_1;
                    this.stateConfVectorPosition = 1;
                }
                enterSequence_main_region_Process_r2_Line_B_2_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2, null, null)));
                    this.stateVector[1] = Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2;
                    this.stateConfVectorPosition = 1;
                }
                enterSequence_main_region_Initialize_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_INITIALIZE, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_INITIALIZE;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_main_region_Cleanup_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_CLEANUP, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION_CLEANUP;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_main_region__final__default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION__FINAL_, null, null)));
                    this.stateVector[0] = Statemachine.State.MAIN_REGION__FINAL_;
                    this.stateConfVectorPosition = 0;
                }
                enterSequence_main_region_default() {
                    this.react_main_region__entry_Default();
                }
                exitSequence_main_region_Process() {
                    this.exitSequence_main_region_Process_r1();
                    this.exitSequence_main_region_Process_r2();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_PROCESS, null, null)));
                }
                exitSequence_main_region_Process_r1_Line_A_1() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_1, null, null)));
                }
                exitSequence_main_region_Process_r1_Line_A_2() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2, null, null)));
                }
                exitSequence_main_region_Process_r2_Line_B_1() {
                    this.stateVector[1] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 1;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_1, null, null)));
                }
                exitSequence_main_region_Process_r2_Line_B_2() {
                    this.stateVector[1] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 1;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2, null, null)));
                }
                exitSequence_main_region_Initialize() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_INITIALIZE, null, null)));
                }
                exitSequence_main_region_Cleanup() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_CLEANUP, null, null)));
                }
                exitSequence_main_region__final_() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.stateConfVectorPosition = 0;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION__FINAL_, null, null)));
                }
                exitSequence_main_region() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_1:
                            this.exitSequence_main_region_Process_r1_Line_A_1();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2:
                            this.exitSequence_main_region_Process_r1_Line_A_2();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_INITIALIZE:
                            this.exitSequence_main_region_Initialize();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_CLEANUP:
                            this.exitSequence_main_region_Cleanup();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION__FINAL_:
                            this.exitSequence_main_region__final_();
                            break;
                        default:
                            break;
                    }
                    switch ((this.stateVector[1])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_1:
                            this.exitSequence_main_region_Process_r2_Line_B_1();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_PROCESS, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2:
                            this.exitSequence_main_region_Process_r2_Line_B_2();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MAIN_REGION_PROCESS, null, null)));
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_Process_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_1:
                            this.exitSequence_main_region_Process_r1_Line_A_1();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2:
                            this.exitSequence_main_region_Process_r1_Line_A_2();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_main_region_Process_r2() {
                    switch ((this.stateVector[1])) {
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_1:
                            this.exitSequence_main_region_Process_r2_Line_B_1();
                            break;
                        case sct.yakindu.io.Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2:
                            this.exitSequence_main_region_Process_r2_Line_B_2();
                            break;
                        default:
                            break;
                    }
                }
                react_main_region__entry_Default() {
                    this.enterSequence_main_region_Initialize_default();
                }
                react_main_region__sync0() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MAIN_REGION_PROCESS, null, null)));
                    this.enterSequence_main_region_Process_r1_Line_A_1_default();
                    this.enterSequence_main_region_Process_r2_Line_B_1_default();
                }
                react_main_region__sync1() {
                    this.enterSequence_main_region_Cleanup_default();
                }
                react(transitioned_before) {
                    return transitioned_before;
                }
                main_region_Process_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_Process_r1_Line_A_1_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.pa) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_1, null, 0)));
                            this.exitSequence_main_region_Process_r1_Line_A_1();
                            this.enterSequence_main_region_Process_r1_Line_A_2_default();
                            transitioned_after = 0;
                        }
                    }
                    return transitioned_after;
                }
                main_region_Process_r1_Line_A_2_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (((true && this.isStateActive(Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2)) && true)) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2, null, 0)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2, null, 0)));
                            this.exitSequence_main_region_Process();
                            this.react_main_region__sync1();
                            transitioned_after = 0;
                        }
                    }
                    return transitioned_after;
                }
                main_region_Process_r2_Line_B_1_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 1) {
                        if (this.pb) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_1, null, 0)));
                            this.exitSequence_main_region_Process_r2_Line_B_1();
                            this.enterSequence_main_region_Process_r2_Line_B_2_default();
                            this.main_region_Process_react(0);
                            transitioned_after = 1;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_Process_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_Process_r2_Line_B_2_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 1) {
                        if (((true && this.isStateActive(Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2)) && true)) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_PROCESS_R1_LINE_A_2, null, 0)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_PROCESS_R2_LINE_B_2, null, 0)));
                            this.exitSequence_main_region_Process();
                            this.react_main_region__sync1();
                            transitioned_after = 1;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.main_region_Process_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_Initialize_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.proceed) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_INITIALIZE, null, 0)));
                            this.exitSequence_main_region_Initialize();
                            this.react_main_region__sync0();
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region_Cleanup_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.proceed) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MAIN_REGION_CLEANUP, null, 0)));
                            this.exitSequence_main_region_Cleanup();
                            this.enterSequence_main_region__final__default();
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                main_region__final__react(transitioned_before) {
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
                    State[State["MAIN_REGION_PROCESS"] = 0] = "MAIN_REGION_PROCESS";
                    State[State["MAIN_REGION_PROCESS_R1_LINE_A_1"] = 1] = "MAIN_REGION_PROCESS_R1_LINE_A_1";
                    State[State["MAIN_REGION_PROCESS_R1_LINE_A_2"] = 2] = "MAIN_REGION_PROCESS_R1_LINE_A_2";
                    State[State["MAIN_REGION_PROCESS_R2_LINE_B_1"] = 3] = "MAIN_REGION_PROCESS_R2_LINE_B_1";
                    State[State["MAIN_REGION_PROCESS_R2_LINE_B_2"] = 4] = "MAIN_REGION_PROCESS_R2_LINE_B_2";
                    State[State["MAIN_REGION_INITIALIZE"] = 5] = "MAIN_REGION_INITIALIZE";
                    State[State["MAIN_REGION_CLEANUP"] = 6] = "MAIN_REGION_CLEANUP";
                    State[State["MAIN_REGION__FINAL_"] = 7] = "MAIN_REGION__FINAL_";
                    State[State["$NULLSTATE$"] = 8] = "$NULLSTATE$";
                })(State = Statemachine.State || (Statemachine.State = {}));
                /**
                 * Enumeration of all features of the statechart
                 * @enum
                 * @property {sct.yakindu.io.Statemachine.Feature} NO_FEATURE
                 * @property {sct.yakindu.io.Statemachine.Feature} PROCEED
                 * @property {sct.yakindu.io.Statemachine.Feature} PA
                 * @property {sct.yakindu.io.Statemachine.Feature} PB
                 * @class
                 */
                let Feature;
                (function (Feature) {
                    Feature[Feature["NO_FEATURE"] = 0] = "NO_FEATURE";
                    Feature[Feature["PROCEED"] = 1] = "PROCEED";
                    Feature[Feature["PA"] = 2] = "PA";
                    Feature[Feature["PB"] = 3] = "PB";
                })(Feature = Statemachine.Feature || (Statemachine.Feature = {}));
            })(Statemachine = io.Statemachine || (io.Statemachine = {}));
        })(io = yakindu.io || (yakindu.io = {}));
    })(yakindu = sct.yakindu || (sct.yakindu = {}));
})(sct || (sct = {}));
