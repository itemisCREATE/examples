import {ModuleWithProviders} from "@angular/core";
import {RouterModule, Routes} from "@angular/router";
import {YStartScreenComponent} from "./y-start-screen.component";

const routes:Routes = [
  {path: 'startScreen', component:YStartScreenComponent}
];

export var startScreenRoute:ModuleWithProviders = RouterModule.forRoot(routes);
