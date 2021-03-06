//
//  MetaViewController.h
//  Doom
//
//  Created by Matthieu DESILE on 3/6/13.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "GameViewController.h"
#import "MenuViewController.h"

@class EAGLView;

enum controller_t {
    main_menu = 0,
    control_menu,
    settings_menu,
    legal_menu,
    credits_menu,
    level_menu,
    game_control
} ;

@interface MetaViewController : UIViewController
{
    MenuViewController* mainMenuViewController;
    MenuViewController* mapMenuViewController;
    MenuViewController* creditsMenuViewController;
    MenuViewController* legalMenuViewController;
    MenuViewController* settingsMenuViewController;
    MenuViewController* controlsMenuViewController;
    MenuViewController* episodeMenuViewController;
    MenuViewController* levelMenuViewController;
    GameViewController* gameViewController;
    CADisplayLink * displayLink;

    BOOL    IBMenuVisible;
}

//@property (nonatomic, retain) CADisplayLink *displayLink;

//- (void) SelectEpisode: (int) episode;
/* */
- (void) PrepareForViewSwap;
- (void) ResumeGame;
- (void) NewGame;
- (void) DemoGame;
- (void) MainMenu;
- (void) CreditsMenu;
- (void) LegalMenu;
- (void) GotoSupport;
- (void) idSoftwareApps;
- (void) SettingsMenu;
- (void) ControlsMenu;

- (void) playMap: (int) dataset : (int) episode : (int) map : (int) skill;

- (void) HUDLayout;
- (void) HideIB;

- (void) switchToMenu: (enum controller_t) menu;
- (void) pauseDisplayLink: (BOOL) pause;

@end
