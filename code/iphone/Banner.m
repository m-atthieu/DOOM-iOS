//
//  Banner.m
//  Doom
//
//  Created by Matthieu DESILE on 3/9/13.
//
//

#import "Banner.h"

@implementation Banner_SubItem
@end

@implementation Banner_SubMenu

- (void) awakeFromNib
{
    isHidden = YES;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    
    if (hitView != self) {
        return hitView;
    }
    
    return nil;
}

- (void) display: (BOOL) display
{
    if(display){
        [self Show];
    } else {
        [self Hide];
    }
}

- (void) Hide
{
    
    if( !isHidden ) {
        
        isHidden = YES;
        
        [UIView beginAnimations:@"Show" context:nil];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
        [UIView setAnimationBeginsFromCurrentState:NO];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(Disable)];
        
        self.alpha = 1.0f;
        [ self viewWithTag: 0 ].alpha = 0.0f;
        
        [UIView commitAnimations];
        
    }
}

- (void) Show {
    
    if( isHidden ) {
        
        isHidden = NO;
        
        [UIView beginAnimations:@"Show" context:nil];
        [UIView setAnimationDuration:0.5f];
        [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
        [UIView setAnimationBeginsFromCurrentState:NO];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(Enable)];
        
        self.alpha = 1.0f;
        [ self viewWithTag: 0 ].alpha = 1.0f;
        
        [UIView commitAnimations];
    }
}

@end

