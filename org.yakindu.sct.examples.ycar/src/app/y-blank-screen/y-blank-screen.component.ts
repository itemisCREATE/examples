import {Component} from "@angular/core";
import {AppService} from "../app.service";
import {PageAnimation} from "../shared/animations/page.animation";

@Component({
    selector: 'app-y-blank-screen',
    templateUrl: './y-blank-screen.component.html',
    styleUrls: ['./y-blank-screen.component.css'],
    animations: PageAnimation.page
})
export class YBlankScreenComponent  {

    animationState:string = "scaleOut";

    constructor(public appService: AppService) {}

    ngOnInit() {
        setTimeout(()=> {
            this.animationState = "scaleIn";
        }, 10)
    }
}
