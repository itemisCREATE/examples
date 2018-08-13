import { Injectable } from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";

@Injectable()
export class YMenuWidgetService {

  constructor(public router: Router, private route:ActivatedRoute) { }


  navigateTo(menuItem:string) {
    console.log(menuItem);
    this.router.navigate(['../' + menuItem ], {relativeTo: this.route})
  }


}
