import { RouterModule } from '@angular/router';
import { YBlankScreenComponent } from "./y-blank-screen.component";
var routes = [
    { path: 'welcomeScreen', component: YBlankScreenComponent }
];
export var blankScreenRoute = RouterModule.forRoot(routes);
