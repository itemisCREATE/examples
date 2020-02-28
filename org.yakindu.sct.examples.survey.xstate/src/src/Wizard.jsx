import React from "react";
import { useMachine } from "@xstate/react";
import { wizardMachine } from "./wizardMachine";
import { Step } from "./Step";

export function Wizard() {
  const [current, send] = useMachine(wizardMachine);

  return (
    <div className="App">
      {current.matches("one") ? (
        <Step
          key="one"
          title="Step one"
          onSubmit={value => send("NEXT", { value })}
        />
      ) : current.matches("two") ? (
        <Step
          key="two"
          title="Step two"
          onSubmit={value => send("NEXT", { value })}
        />
      ) : current.matches("three") ? (
        <Step
          key="three"
          title="Step three"
          onSubmit={value => send("NEXT", { value })}
        />
      ) : current.matches("loading") ? (
        <strong>Loading...</strong>
      ) : current.matches("failure") ? (
        <div>
          <div className="error">
            <strong>Failed to submit.</strong>
            <br />
            <small>Don't feel bad, it fails half the time.</small>
          </div>
          <button onClick={() => send("RETRY")}>Retry?</button>
        </div>
      ) : current.matches("success") ? (
        <strong className="success">Submitted!</strong>
      ) : null}
      <pre style={{ textAlign: "left" }}>
        {JSON.stringify(
          { value: current.value, context: current.context },
          null,
          2
        )}
      </pre>
    </div>
  );
}
