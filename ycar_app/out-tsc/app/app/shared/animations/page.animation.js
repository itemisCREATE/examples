import { animate, transition, style, state, trigger } from "@angular/core";
/**
 * Created by dennisvandervlugt on 29.11.16.
 */
export var PageAnimation = (function () {
    function PageAnimation() {
    }
    PageAnimation.page = [
        trigger('scaleInOut', [
            state('scaleIn', style({
                transform: 'scale(1)'
            })),
            state('scaleOut', style({
                transform: 'scale(0)'
            })),
            transition('scaleOut => scaleIn', animate('500ms ease-out')),
            transition('scaleIn => scaleOut', animate('500ms ease-out'))
        ])
    ];
    PageAnimation.boxslide = [
        trigger('flyInOut', [
            state('in', style({ transform: 'translateX(0)' })),
            transition('void => *', [
                style({ transform: 'translateX(100%)' }),
                animate(500)
            ]),
            transition('* => void', [
                animate(500, style({ transform: 'translateX(-100%)' }))
            ])
        ])
    ];
    return PageAnimation;
}());
