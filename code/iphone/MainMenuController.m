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
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
- (void) initialize{
    
    // Hide Everything.
    [self ResetMenu];
    
}

- (void)awakeFromNib {
    
    [self initialize];
    
}

- (void) ResetMenu {
    
    
}


- (IBAction) ResumeGamePressed {
    
    [self.container ResumeGame];
    
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

- (IBAction) NewGamePressed {
    
    // Go to the Map Menu.
    [self.container NewGame];
    
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
    
}

- (IBAction) MultiplayerPressed {
    
    // Go to the MP Menu.
    // get the address for the local service, which may
    // start up a bluetooth personal area network
    boolean serverResolved = ResolveNetworkServer( &netServer.address );
    
    // open our socket now that the network interfaces have been configured
    // Explicitly open on interface 1, which is en0.  If bluetooth ever starts
    // working better, we can handle multiple interfaces.
    if ( gameSocket <= 0 ) {
        gameSocket = UDPSocket( "en0", DOOM_PORT );
    }
    
    // get the address for the local service
    if ( !serverResolved ) {
        // nobody else is acting as a server, so start one here
        RegisterGameService();
        SetupEmptyNetGame();
    }
	
    menuState = IPM_MULTIPLAYER;
    
    [self.container HideIB];
    
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
    
}

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
    //[self.container LegalMenu];
    
    //Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

- (IBAction) DemoPressed {
    [self.container DemoGame ];
    
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

- (IBAction) OtherIdGamesPressed {
    
    [self.container idSoftwareApps];
    
    Sound_StartLocalSound( "iphone/baborted_01.wav" );
}

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

- (void) ShowPlayBanner {
    
    [ mPlayButton setEnabled: NO ];
    [ mSettingsButton setEnabled: YES ];
    [ mAboutButton setEnabled: YES ];
    [ mExtrasButton setEnabled: YES ];
    
    [ mPlaySubMenu Show ];
    [ mSettingsSubMenu Hide ];
    [ mExtrasSubMenu Hide ];
    [ mAboutSubMenu Hide ];
    
}

- (void) ShowSettingsBanner {
    
    [ mPlayButton setEnabled: YES ];
    [ mSettingsButton setEnabled: NO ];
    [ mAboutButton setEnabled: YES ];
    [ mExtrasButton setEnabled: YES ];
    
    [ mSettingsSubMenu Show ];
    [ mPlaySubMenu Hide ];
    [ mExtrasSubMenu Hide ];
    [ mAboutSubMenu Hide ];
}

- (void) ShowAboutBanner {
    
    [ mPlayButton setEnabled: YES ];
    [ mSettingsButton setEnabled: YES ];
    [ mAboutButton setEnabled: NO ];
    [ mExtrasButton setEnabled: YES ];
    
    [ mAboutSubMenu Show ];
    [ mPlaySubMenu Hide ];
    [ mSettingsSubMenu Hide ];
    [ mExtrasSubMenu Hide ];
}

- (void) ShowExtrasBanner {
    
    [ mPlayButton setEnabled: YES ];
    [ mSettingsButton setEnabled: YES ];
    [ mAboutButton setEnabled: YES ];
    [ mExtrasButton setEnabled: NO ];
    
    [ mExtrasSubMenu Show ];
    [ mPlaySubMenu Hide ];
    [ mSettingsSubMenu Hide ];
    [ mAboutSubMenu Hide ];
}
@end
