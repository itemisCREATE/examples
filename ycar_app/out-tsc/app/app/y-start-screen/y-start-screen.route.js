/**
 * Created by dennisvandervlugt on 04.11.16.
 */
import { RouterModule } from "@angular/router";
import { YStartScreenComponent } from "./y-start-screen.component";
var routes = [
    { path: 'startScreen', component: YStartScreenComponent }
];
export var startScreenRoute = RouterModule.forRoot(routes);
