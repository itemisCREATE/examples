import {NgModule} from "@angular/core";
import {RouterModule, Routes} from "@angular/router";

const routes: Routes = [
  /*blankScreen route is defined in YBlankScreenModule */
  {path: '', pathMatch: 'full', redirectTo: 'welcomeScreen'}

];

@NgModule({
  imports: [
    RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: []
})
export class YCarHMIAPPRoutingModule {
}



