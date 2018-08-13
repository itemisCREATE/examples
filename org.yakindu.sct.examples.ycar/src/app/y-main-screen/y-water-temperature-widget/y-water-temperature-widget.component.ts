import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'y-water-temperature-widget',
  templateUrl: './y-water-temperature-widget.component.html',
  styleUrls: ['./y-water-temperature-widget.component.css']
})
export class YWaterTemperatureWidgetComponent implements OnInit {

  private _temperature:number = 0;

  set temperature(t:number) {

    this._temperature = t ;
  }

  constructor() { }

  ngOnInit() {
  }

}
