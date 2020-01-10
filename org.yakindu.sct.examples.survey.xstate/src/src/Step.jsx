import React from "react";
import { useMachine } from "@xstate/react";
import { stepMachine } from "./stepMachine";

export function Step({ onSubmit, title }) {
  const [current, send] = useMachine(stepMachine, {
    actions: {
      submit: ctx => onSubmit(ctx.value)
    }
  });

  const { value } = current.context;

  const editing = current.matches("editing");
  const invalid = current.matches({ editing: "invalid" });

  return (
    <form
      onSubmit={e => {
        e.preventDefault();
        send("SUBMIT");
      }}
    >
      <h3>{title}</h3>
      {invalid ? <div className="error">Sorry, that's invalid.</div> : null}
      <input
        autoFocus
        placeholder="only letters are valid"
        value={value}
        style={{
          borderColor: invalid ? "red" : undefined
        }}
        onChange={e => send("CHANGE", { value: e.target.value })}
        disabled={!editing}
        data-testid="input"
      />
      <button disabled={!editing || invalid} data-testid="save-button">
        Save
      </button>
    </form>
  );
}
