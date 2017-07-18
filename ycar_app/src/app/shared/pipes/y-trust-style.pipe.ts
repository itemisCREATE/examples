import {Pipe, PipeTransform } from '@angular/core';
import {DomSanitizer} from "@angular/platform-browser";

@Pipe({
  name: 'yTrustStyle'
})
export class YTrustStylePipe implements PipeTransform {

  constructor(private santizier: DomSanitizer) {}

  transform(value: any, args: any[]): any {
    return this.santizier.bypassSecurityTrustStyle(value);
  }

}
