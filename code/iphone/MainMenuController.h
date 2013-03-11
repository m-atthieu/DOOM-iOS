//
//  MainMenuController.h
//  Doom
//
//  Created by Matthieu DESILE on 3/8/13.
//
//

#import "MenuViewController.h"
#import "MetaViewController.h"
#import "UIFontButton.h"
#import "Banner.h"


@interface MainMenuController : MenuViewController
{
    IBOutlet UIFontButton *  mPlayButton;
    IBOutlet UIFontButton *  mSettingsButton;
    IBOutlet UIFontButton *  mAboutButton;
    IBOutlet UIFontButton *  mExtrasButton;

    IBOutlet Banner_SubMenu * mPlaySubMenu;
    IBOutlet Banner_SubMenu * mSettingsSubMenu;
    IBOutlet Banner_SubMenu * mAboutSubMenu;
    IBOutlet Banner_SubMenu * mExtrasSubMenu;
}

- (id) initWithContainer: (MetaViewController*) container;

// Sub Menu Banner Actions
- (IBAction) ShowPlayBanner;
- (IBAction) ShowSettingsBanner;
- (IBAction) ShowAboutBanner;
- (IBAction) ShowExtrasBanner;

- (void) ResetMenu;

// Interface Builder Actions  ( Connected through IB )
- (IBAction) ResumeGamePressed;
- (IBAction) NewGamePressed;
- (IBAction) MultiplayerPressed;
- (IBAction) CreditsPressed;
- (IBAction) SupportPressed;
- (IBAction) LegalPressed;
- (IBAction) DemoPressed;
- (IBAction) OtherIdGamesPressed;
- (IBAction) ControlsOptionsPressed;
- (IBAction) SettingsOptionsPressed;

@end
