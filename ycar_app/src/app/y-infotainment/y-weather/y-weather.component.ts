import {Component, OnInit} from '@angular/core';
import {YWeatherService, WEATHER_SYMBOL} from "./y-weather.service";
import {PageAnimation} from "../../shared/animations/page.animation";

@Component({
  selector: 'y-weather',
  inputs: ['temperature', 'sunrise', 'sunset', 'weather'],
  templateUrl: './y-weather.component.html',
  styleUrls: ['./y-weather.component.css'],
  animations: PageAnimation.page
})
export class YWeatherComponent implements OnInit {

  state:string = "scaleOut";

  //region *** Weather ***
  private weathersymbol = WEATHER_SYMBOL;
  private _weather: WEATHER_SYMBOL;

  set weather(w: WEATHER_SYMBOL) {
    this._weather = w;
  }

  get weather(): WEATHER_SYMBOL {
    return this._weather;
  }

  //endregion

  //region *** Temperature ***
  private _temperature: number;

  set temperature(t: number) {
    this._temperature = t;
  }

  get temperature(): number {
    return this._temperature;
  }

  //endregion

  //region *** Sunset ***
  private _sunrise: string;

  set sunrise(s: string) {
    this._sunrise = s;
  }

  get sunrise(): string {
    return this._sunrise;
  }

  //endregion

  //region *** Sunset ***

  private _sunset: string;

  set sunset(s: string) {
    this._sunset = s;
  }

  get sunset(): string {
    return this._sunset;
  }

  //endregion


  constructor(public weatherService: YWeatherService) {
    this.temperature = 26;
    this.sunrise = '6:35';
    this.sunset = '8:20';
    this.weather = WEATHER_SYMBOL.SUNNY;

    weatherService.onChangedTemperature
      .subscribe(t => this.temperature = t);

    weatherService.onChangedWeather
      .subscribe(w => this.weather = w);

    weatherService.onChangeSunset
      .subscribe(s => this.sunset = s);

    weatherService.onChangeSunrise
      .subscribe(s => this.sunrise = s)
  }


  ngOnInit() {
    setTimeout(()=> {
      this.state = "scaleIn";
    }, 10)
  }

}

