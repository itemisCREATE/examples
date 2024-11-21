import { interpret } from "xstate";
import {TrafficLightCtrl} from "./TrafficLightCtrl";
import { inspect } from '@xstate/inspect';
import "./style.css"

inspect({
  iframe: () => document.querySelector("iframe[data-xstate]") as HTMLIFrameElement
});

function setTrafficLights(red : boolean, yellow : boolean, green : boolean){
  if(red){
    document.getElementById("redLight").style.visibility = 'visible';
  }else{
    document.getElementById("redLight").style.visibility = 'hidden';
  }
  if(yellow){
    document.getElementById("yellowLight").style.visibility = 'visible';
  }else{
    document.getElementById("yellowLight").style.visibility = 'hidden';
  }
  if(green){
    document.getElementById("greenLight").style.visibility = 'visible';
  }else{
    document.getElementById("greenLight").style.visibility = 'hidden';
  }
}

function setPedestrianLights(pedestrian1 : boolean, pedestrian2 : boolean){  
  if(pedestrian1){
    document.getElementById("pedestrianLight1").style.visibility = 'visible';
  }else{
    document.getElementById("pedestrianLight1").style.visibility = 'hidden';
  }
  if(pedestrian1){
    document.getElementById("pedestrianLight2").style.visibility = 'visible';
  }else{
    document.getElementById("pedestrianLight2").style.visibility = 'hidden';
  }
}

document.getElementById("scene-container").innerHTML = `
<div class="scene">
    <img src="./images/road.png" id="roadImage"></img>
    <img src="./images/trafficLightAllOff.png" id="trafficLight"></img>
    <img src="./images/red.png" id="redLight" class="lamp"></img>
    <img src="./images/yellow.png" id="yellowLight" class="lamp"></img>
    <img src="./images/green.png" id="greenLight" class="lamp"></img>
    <img src="./images/yellow.png" class="yellowPedestrianLight pedestrianLight1 lamp" id="pedestrianLight1"></img>
    <img src="./images/yellow.png" class="yellowPedestrianLight pedestrianLight2 lamp" id="pedestrianLight2"></img>
    <img src="./images/French-Pedestrian-Silhouette.svg" id="pedestrianImage"></img>
    <div class="buttons">
        <button id="button1" class="button1" type="button" onClick="functionOnOff()">ON/OFF</button>
        <button id="button2" class="button2" type="button" onClick="functionRequest()">Request</button>
    </div>
</div>
`;

document.getElementById("button1").onclick = function(){
  service.send("onOff")
}
document.getElementById("button2").onclick = function(){
  service.send("pedestrianRequest")
}

const service = interpret(TrafficLightCtrl, { devTools: true })

service.machine.context.TrafficLight.off$.subscribe(() => setTrafficLights(false, false, false))
service.machine.context.TrafficLight.red$.subscribe(() => setTrafficLights(true, false, false))
service.machine.context.TrafficLight.preparing$.subscribe(() => setTrafficLights(true, true, false))
service.machine.context.TrafficLight.yellow$.subscribe(() => setTrafficLights(false, true, false))
service.machine.context.TrafficLight.green$.subscribe(() => setTrafficLights(false, false, true))
service.machine.context.Pedestrian.off$.subscribe(() => setPedestrianLights(false, false))
service.machine.context.Pedestrian.red$.subscribe(() => setPedestrianLights(true, false))
service.machine.context.Pedestrian.green$.subscribe(() => setPedestrianLights(false, true))

service.start();

