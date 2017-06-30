import { ModuleWithProviders} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import {YBlankScreenComponent} from "./y-blank-screen.component";

const routes: Routes = [
  {path: 'welcomeScreen', component: YBlankScreenComponent}
];

export var blankScreenRoute:ModuleWithProviders = RouterModule.forRoot(routes);

