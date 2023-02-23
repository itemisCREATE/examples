import * as React from "react";
import { createRoot } from "react-dom/client";
import { createMachine, assign } from "xstate";
import { useMachine } from "@xstate/react";
import {TrafficLightCtrl, StatechartContext} from "./TrafficLightCtrl";
import {SceneApp, setTrafficLights, setPedestrianLights} from "./scene";
import { inspect } from '@xstate/inspect';





function App() {
  const [current, send] = useMachine(TrafficLightCtrl, {context:new StatechartContext(), devTools: true});
  current.context.TrafficLight.off$.subscribe(() => setTrafficLights(false, false, false))
  current.context.TrafficLight.red$.subscribe(() => setTrafficLights(true, false, false))
  current.context.TrafficLight.preparing$.subscribe(() => setTrafficLights(true, true, false))
  current.context.TrafficLight.yellow$.subscribe(() => setTrafficLights(false, true, false))
  current.context.TrafficLight.green$.subscribe(() => setTrafficLights(false, false, true))

  
  current.context.Pedestrian.off$.subscribe(() => setPedestrianLights(false, false))
  current.context.Pedestrian.red$.subscribe(() => setPedestrianLights(true, false))
  current.context.Pedestrian.green$.subscribe(() => setPedestrianLights(false, true))

  return SceneApp(() => send("onOff"), () => send("pedestrianRequest"));
}



const rootElement = document.getElementById("root");
const root = createRoot(rootElement);
const d = root.render(<App />);

// how to find that part of document, which might not be rendered yet
inspect({
  iframe: false,//() => (document.querySelector('iframe data-xstate') as HTMLIFrameElement),
  url: 'https://statecharts.io/inspect'
});
