//
//  MainMenuController.m
//  Doom
//
//  Created by Matthieu DESILE on 3/8/13.
//
//

#import "MainMenuController.h"

#include "doomiphone.h"

@interface MainMenuController ()

@end

@implementation MainMenuController

- (id) initWithContainer: (MetaViewController*) container
{
    self = [super initWithNibName: @"MainMenuView"
                           bundle: [NSBundle mainBundle]];
    if (self) {
        [self setContainer: container];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self ResetMenu];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) ResetMenu
{
    [mPlaySubMenu display: NO];
    [mSettingsSubMenu display: NO];
    [mAboutSubMenu display: NO];
    [mExtrasSubMenu display: NO];
}

#pragma mark - Switch to Other Controllers

#pragma mark Play Submenu
- (IBAction) ResumeGamePressed
{
    [self.container ResumeGame];
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

- (IBAction) NewGamePressed
{
    // Go to the Map Menu.
    [self.container NewGame];
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

/* a deplacer dans le container */
- (IBAction) MultiplayerPressed
{
    [self.container MultiplayerGame];
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
    
}

#pragma mark Settings Submenu
- (IBAction) ControlsOptionsPressed
{
    [self.container switchToMenu: control_menu];
    //Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

- (IBAction) SettingsOptionsPressed
{
    [self.container switchToMenu: settings_menu];
    //Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

#pragma mark About Submenu

- (IBAction) CreditsPressed
{
    [self.container CreditsMenu];
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

- (IBAction) SupportPressed
{
    [self.container GotoSupport];
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

- (IBAction) LegalPressed
{
    [self.container switchToMenu: legal_menu];
    //Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

#pragma mark Extras Submenu

- (IBAction) OtherIdGamesPressed
{
    [self.container idSoftwareApps];
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
}
/*- (IBAction) DemoPressed
{
    [self.container DemoGame ];
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
    }*/


#pragma mark - Sub Menus

- (void) disableAllBannerExcept: (Banner_SubMenu*) banner andButton: (UIFontButton*) button
{
    [ mPlayButton setEnabled: (mPlayButton != button) ];
    [ mSettingsButton setEnabled: (mSettingsButton != button) ];
    [ mAboutButton setEnabled: (mAboutButton != button) ];
    [ mExtrasButton setEnabled: (mExtrasButton != button) ];
    
    [ mPlaySubMenu display: (banner == mPlaySubMenu) ];
    [ mSettingsSubMenu display: (banner == mSettingsSubMenu) ];
    [ mExtrasSubMenu display: (banner == mExtrasSubMenu) ];
    [ mAboutSubMenu display: (banner == mAboutSubMenu) ];
}

- (void) ShowPlayBanner
{
    [self disableAllBannerExcept: mPlaySubMenu andButton: mPlayButton];
}

- (void) ShowSettingsBanner
{
    [self disableAllBannerExcept: mSettingsSubMenu andButton: mSettingsButton];
}

- (void) ShowAboutBanner
{
    [self disableAllBannerExcept: mAboutSubMenu andButton: mAboutButton];
}

- (void) ShowExtrasBanner
{
    [self disableAllBannerExcept: mExtrasSubMenu andButton: mExtrasButton];
}
@end
