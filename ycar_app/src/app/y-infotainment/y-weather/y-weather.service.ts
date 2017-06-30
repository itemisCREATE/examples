import {Injectable} from '@angular/core';
import {Subject} from "rxjs";

@Injectable()
export class YWeatherService {

  private temperature = 0;

  onChangedTemperature: Subject<number> = new Subject<number>();
  onChangedWeather: Subject<WEATHER_SYMBOL> = new Subject<WEATHER_SYMBOL>();
  onChangeSunrise: Subject<string> = new Subject<string>();
  onChangeSunset: Subject<string> = new Subject<string>();

  constructor() {}


  changeTemperature(t: number) {
    this.onChangedTemperature.next(t);
  }

  changeWeather(w: WEATHER_SYMBOL) {
    this.onChangedWeather.next(w);
  }

  changeSunrise(s:string) {
    this.onChangeSunrise.next(s);
  }

  changeSunset(s:string) {
    this.onChangeSunset.next(s);
  }
}

export enum WEATHER_SYMBOL {
  PARTLY_CLOUDY, CLOUDY, SUNNY
}

