import { Machine, assign } from "xstate";
import { validate } from "./utils";

export const stepMachine = Machine({
  initial: "editing",
  context: {
    value: ""
  },
  states: {
    editing: {
      on: {
        CHANGE: {
          target: ".idle",
          actions: assign({
            value: (ctx, e) => e.value
          })
        },
        SUBMIT: "validating"
      },
      initial: "idle",
      states: {
        idle: {},
        invalid: {}
      }
    },
    validating: {
      invoke: {
        id: "validating",
        src: ctx => validate(ctx.value),
        onDone: "validated",
        onError: "editing.invalid"
      }
    },
    validated: {
      entry: "submit",
      type: "final"
    }
  }
});
