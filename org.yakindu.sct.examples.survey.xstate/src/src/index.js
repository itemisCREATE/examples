import "./styles.css";
import React from "react";
import ReactDOM from "react-dom";
import { Wizard } from "./Wizard";

function App() {
  return <Wizard />;
}

const rootElement = document.getElementById("root");
ReactDOM.render(<App />, rootElement);
