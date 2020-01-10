"use strict";
exports.__esModule = true;
var utils_1 = require("./utils");
var xstate_1 = require("xstate");
exports.wizardMachine = xstate_1.Machine({
    id: 'wizard',
    context: {
        one: null,
        two: null,
        three: null
    },
    initial: 'one',
    states: {
        one: {
            type: 'atomic',
            id: 'one',
            on: {
                NEXT: {
                    target: 'two',
                    actions: ['assignOne']
                }
            }
        },
        two: {
            type: 'atomic',
            id: 'two',
            on: {
                NEXT: {
                    target: 'three',
                    actions: ['assignTwo']
                }
            }
        },
        three: {
            type: 'atomic',
            id: 'three',
            on: {
                NEXT: {
                    target: 'loading',
                    actions: ['assignThree']
                }
            }
        },
        loading: {
            type: 'atomic',
            id: 'loading',
            entry: ['submit'],
            on: {
                '': [
                    {
                        target: 'failure',
                        cond: 'getFailure'
                    },
                    {
                        target: 'success',
                        cond: 'getSuccess'
                    }
                ]
            }
        },
        failure: {
            type: 'atomic',
            id: 'failure',
            on: {
                RETRY: {
                    target: 'loading'
                }
            }
        },
        success: {
            type: 'atomic',
            id: 'success',
            on: {}
        }
    }
}, {
    actions: {
        assignOne: xstate_1.assign({ one: function (context, event) { return event.value; } }),
        assignTwo: xstate_1.assign({ two: function (context, event) { return event.value } }),
        assignThree: xstate_1.assign({ three: function (context, event) { return event.value; } }),
        submit: function (context, event) {
            utils_1.resetStatus();
        }
    },
    guards: {
        getFailure: function (context, event) {
            return utils_1.getStatus();
        },
        getSuccess: function (context, event) {
            return utils_1.getNotStatus();
        }
    }
});
