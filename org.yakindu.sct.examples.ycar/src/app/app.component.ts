import {Component} from "@angular/core";
import {IOperationCallback, ScreenService} from "./gen/statemachine/screenService.statemachine";
import {Subject} from "rxjs";
import {RouterService} from "./shared/services/router.service";
import {AppService, HmiState} from "./app.service";


@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.css']
})
export class AppComponent {
    turnOff$: Subject<any> = new Subject<any>();
    turnOn$:  Subject<any> = new Subject<any>();

    constructor( private screenService: ScreenService, private routerService: RouterService,
                private appService: AppService) {
        this.appService.hmiState.subscribe(state => {
            switch (state) {
                case HmiState.OFF:
                    this.turnOff$.next();
                    break;
                case HmiState.ON:
                    this.turnOn$.next();
            }
        })
    }

    ngAfterViewInit() {
        this.screenService.subscribeOnTurnOff(this.turnOff$);
        this.screenService.subscribeOnTurnOn(this.turnOn$);

        let operationCallback: IOperationCallback = {
            navigateToWelcomeScreen: () => {
                this.routerService.navigate("welcomeScreen")
            },
            navigateToMainScreen: () => {
                this.routerService.navigate("mainScreen")
            }
        };

        this.screenService.defaultScope.setdefaultScopeOperationCallback(operationCallback);
        this.screenService.init();
        this.screenService.enter();
    }
}




