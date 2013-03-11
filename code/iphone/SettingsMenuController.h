//
//  SettingsMenuController.h
//  Doom
//
//  Created by Matthieu DESILE on 3/9/13.
//
//

#import "MenuViewController.h"
#import "UICustomSwitch.h"

@interface SettingsMenuController : MenuViewController
{
    IBOutlet UICustomSwitch * autoUseSwitch;
    IBOutlet UICustomSwitch * statusbarSwitch;
    IBOutlet UICustomSwitch * touchclickSwitch;
    IBOutlet UICustomSwitch * textMessageSwitch;
    IBOutlet UICustomSwitch * drawControlsSwitch;
    IBOutlet UICustomSwitch * musicSwitch;
    IBOutlet UICustomSwitch * centerSticksSwitch;
    IBOutlet UICustomSwitch * rampTurnSwitch;
}

- (id) initWithContainer: (MetaViewController*) container;

- (IBAction) BackToMain;
- (IBAction) ResetToDefaults;
- (IBAction) AutoUseChanged;
- (IBAction) StatusBarChanged;
- (IBAction) TouchClickChanged;
- (IBAction) TextMessagesChanged;
- (IBAction) DrawControlsChanged;
- (IBAction) MusicChanged;
- (IBAction) CenterSticksChanged;
- (IBAction) RampTurnChanged;
@end
