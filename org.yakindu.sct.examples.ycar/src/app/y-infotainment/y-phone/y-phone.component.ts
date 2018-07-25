import {Component, OnInit} from "@angular/core";
import {PageAnimation} from "../../shared/animations/page.animation";

@Component({
  selector: 'y-phone',
  templateUrl: './y-phone.component.html',
  styleUrls: ['./y-phone.component.css'],
  animations: PageAnimation.page
})
export class YPhoneComponent implements OnInit {

  state:string = "scaleOut";

  constructor() { }

  ngOnInit() {

    setTimeout(()=> {
      this.state = "scaleIn";
      console.log(this.state);

    }, 10)


  }

}
