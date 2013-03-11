//
//  ControllerMenuController.h
//  Doom
//
//  Created by Matthieu DESILE on 3/9/13.
//
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"

@interface ControlsMenuController : MenuViewController
{
    IBOutlet UISlider * movestickSize;
    IBOutlet UISlider * turnstickSize;
    IBOutlet UISlider * tiltMoveSpeed;
    IBOutlet UISlider * tiltTurnSpeed;
    
    IBOutlet UIButton * singleThumbButton;
    IBOutlet UIButton * dualThumbButton;
    IBOutlet UIButton * dirWheelButton;
}

- (void)     SetOptions;

- (IBAction) BackToMain;
- (IBAction) HudLayoutPressed;
- (IBAction) SingleThumbpadPressed;
- (IBAction) DualThumbpadPressed;
- (IBAction) DirWheelPressed;

- (IBAction) MoveStickValChanged;
- (IBAction) TurnStickValChanged;
- (IBAction) TiltMoveValChanged;
- (IBAction) TiltTurnValChanged;

@end
