import "./scene.css";
import * as React from "react";
export function SceneApp(functionOnOff : () => void, functionRequest : () => void){
    return (
        <div className="divClass">
            <div className="flexRowHere">
                <div className="scene">
                    <img src="./images/road.png" id="roadImage"></img>
                    <img src="./images/trafficLightAllOff.png" id="trafficLight"></img>
                    <img src="./images/red.png" id="redLight" className="lamp"></img>
                    <img src="./images/yellow.png" id="yellowLight" className="lamp"></img>
                    <img src="./images/green.png" id="greenLight" className="lamp"></img>
                    <img src="./images/yellow.png" className="yellowPedestrianLight pedestrianLight1 lamp" id="pedestrianLight1"></img>
                    <img src="./images/yellow.png" className="yellowPedestrianLight pedestrianLight2 lamp" id="pedestrianLight2"></img>
                    <img src="./images/French-Pedestrian-Silhouette.svg" id="pedestrianImage"></img>
                
                </div>
                <div className="buttons">
                    <button className="button1" type="button" onClick={() => {functionOnOff()}}>ON/OFF</button>
                    <button className="button2" type="button" onClick={() => {functionRequest()}}>Request</button>
                </div>
            </div>
            <div className="visualizer">
              <iframe data-xstate width="800px" height="600px"></iframe>
            </div>
        </div>
    );
}

export function setTrafficLights(red : boolean, yellow : boolean, green : boolean){
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

  export function setPedestrianLights(pedestrian1 : boolean, pedestrian2 : boolean){    
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