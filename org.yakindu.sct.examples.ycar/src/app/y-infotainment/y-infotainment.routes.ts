import {RouterModule, Routes} from "@angular/router";
import {YInfotainmentComponent} from "./y-infotainment.component";
import {YWeatherComponent} from "./y-weather/y-weather.component";
import {NgModule} from "@angular/core";


const infotainmentRoutes: Routes = [
  {path: 'infotainment', component:YInfotainmentComponent,
    children: [
      {path: '', redirectTo: 'weather', pathMatch:'full'},
      {path: 'weather', component: YWeatherComponent}
    ]}
];

@NgModule({
  imports: [
    RouterModule.forChild(infotainmentRoutes)
  ],
  exports: [
    RouterModule
  ]
})
export class YInfotainmentRoutingModule {
}
