//
//  SettingsMenuController.m
//  Doom
//
//  Created by Matthieu DESILE on 3/9/13.
//
//
#include "doomiphone.h"
#import "SettingsMenuController.h"
#import "MetaViewController.h"

@interface SettingsMenuController ()
- (void)   resetSwitches;
@end

@implementation SettingsMenuController

- (id)initWithContainer: (MetaViewController*) container
{
    self = [super initWithNibName: @"SettingsMenuView"
                           bundle: [NSBundle mainBundle]];
    if (self) {
        [self setContainer: container];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)   resetSwitches {
    [ autoUseSwitch setOn: (BOOL)autoUse->value ];
    [ statusbarSwitch setOn: (BOOL)statusBar->value ];
    [ touchclickSwitch setOn: (BOOL)touchClick->value ];
    [ textMessageSwitch setOn: (BOOL)messages->value ];
    [ drawControlsSwitch setOn: (BOOL)drawControls->value ];
    [ musicSwitch setOn: (BOOL)music->value ];
    [ centerSticksSwitch setOn: (BOOL)centerSticks->value ];
    [ rampTurnSwitch setOn: (BOOL)rampTurn->value ];
}

- (void) initialize{
}

- (void) awakeFromNib
{
    [self initialize];
}

- (id) initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder] ) {
        [self initialize];
    }
    
    return self;
}

- (id) initWithFrame:(CGRect)rect{
    if(self = [super initWithFrame:rect] ) {
        [self initialize];
    }
    return self;
}


- (IBAction) BackToMain {
    [self.container switchToMenu: main_menu];
    
    //Sound_StartLocalSound( "iphone/controller_down_01_SILENCE.wav" );
}

- (IBAction) ResetToDefaults {
    
    // reset all cvars except the reverse-landscape mode value
    float value = revLand->value;
    Cvar_Reset_f();
    Cvar_SetValue( revLand->name, value );
    HudSetForScheme(0);
    iphoneStartMusic();
    
    Sound_StartLocalSound( "iphone/controller_down_01_SILENCE.wav" );
    
    [self resetSwitches];
}

- (IBAction) AutoUseChanged {
    Cvar_SetValue( autoUse->name, !autoUse->value );
}

- (IBAction) StatusBarChanged {
    Cvar_SetValue( statusBar->name, !statusBar->value );
}

- (IBAction) TouchClickChanged {
    Cvar_SetValue( touchClick->name, !touchClick->value );
}

- (IBAction) TextMessagesChanged {
    Cvar_SetValue( messages->name, !messages->value );
}

- (IBAction) DrawControlsChanged {
    Cvar_SetValue( drawControls->name, !drawControls->value );
}

- (IBAction) MusicChanged {
    if ( !SysIPhoneOtherAudioIsPlaying() ) {
        Cvar_SetValue( music->name, !music->value );
        if ( music->value ) {
            iphoneStartMusic();
        } else {
            iphoneStopMusic();
        }
    }
}

- (IBAction) CenterSticksChanged {
    Cvar_SetValue( centerSticks->name, !centerSticks->value );
}

- (IBAction) RampTurnChanged {
    Cvar_SetValue( rampTurn->name, !rampTurn->value );
}


@end
