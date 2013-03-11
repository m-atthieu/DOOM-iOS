//
//  ControllerMenuController.m
//  Doom
//
//  Created by Matthieu DESILE on 3/9/13.
//
//

#import "ControlsMenuController.h"

@interface ControlsMenuController ()

@end

@implementation ControlsMenuController

- (id)initWithContainer: (MetaViewController*) container
{
    self = [super initWithNibName: @"ControlsMenuView"
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

- (void) SetOptions
{
    /*movestickSize.value = stickMove->value / 255;
    turnstickSize.value = stickTurn->value / 255;
    tiltMoveSpeed.value = tiltMove->value;
    tiltTurnSpeed.value = tiltTurn->value;
    
    if( controlScheme->value == 0 ) {
        singleThumbButton.enabled = NO;
        dualThumbButton.enabled = YES;
        dirWheelButton.enabled = YES;
    } else if( controlScheme->value == 1 ) {
        singleThumbButton.enabled = YES;
        dualThumbButton.enabled = NO;
        dirWheelButton.enabled = YES;
    } else if( controlScheme->value == 2 ) {
        singleThumbButton.enabled = YES;
        dualThumbButton.enabled = YES;
        dirWheelButton.enabled = NO;
    }*/
}

- (IBAction) BackToMain {
    [self.container MainMenu];
    Sound_StartLocalSound( "iphone/controller_down_01_SILENCE.wav" );
}

- (IBAction) HudLayoutPressed {
    
    [self.container HUDLayout];
}

- (IBAction) SingleThumbpadPressed {
    
    /*Cvar_SetValue( controlScheme->name, 0 );
    HudSetForScheme( 0 );
    
    if( controlScheme->value == 0 ) {
        singleThumbButton.enabled = NO;
        dualThumbButton.enabled = YES;
        dirWheelButton.enabled = YES;
    } else if( controlScheme->value == 1 ) {
        singleThumbButton.enabled = YES;
        dualThumbButton.enabled = NO;
        dirWheelButton.enabled = YES;
    } else if( controlScheme->value == 2 ) {
        singleThumbButton.enabled = YES;
        dualThumbButton.enabled = YES;
        dirWheelButton.enabled = NO;
    }
    */
}

- (IBAction) DualThumbpadPressed {
    
    /*Cvar_SetValue( controlScheme->name, 1 );
    HudSetForScheme( 1 );
    
    if( controlScheme->value == 0 ) {
        singleThumbButton.enabled = NO;
        dualThumbButton.enabled = YES;
        dirWheelButton.enabled = YES;
    } else if( controlScheme->value == 1 ) {
        singleThumbButton.enabled = YES;
        dualThumbButton.enabled = NO;
        dirWheelButton.enabled = YES;
    } else if( controlScheme->value == 2 ) {
        singleThumbButton.enabled = YES;
        dualThumbButton.enabled = YES;
        dirWheelButton.enabled = NO;
    }*/
}

- (IBAction) DirWheelPressed {
    /*
    Cvar_SetValue( controlScheme->name, 2 );
    HudSetForScheme( 2 );
    
    if( controlScheme->value == 0 ) {
        singleThumbButton.enabled = NO;
        dualThumbButton.enabled = YES;
        dirWheelButton.enabled = YES;
    } else if( controlScheme->value == 1 ) {
        singleThumbButton.enabled = YES;
        dualThumbButton.enabled = NO;
        dirWheelButton.enabled = YES;
    } else if( controlScheme->value == 2 ) {
        singleThumbButton.enabled = YES;
        dualThumbButton.enabled = YES;
        dirWheelButton.enabled = NO;
    }*/
}

- (IBAction) MoveStickValChanged {
    
    //Cvar_SetValue( stickMove->name, movestickSize.value * 256.0f );
    
}

- (IBAction) TurnStickValChanged {
    
    //Cvar_SetValue( stickTurn->name, turnstickSize.value * 256.0f );
}

- (IBAction) TiltMoveValChanged {
    /*Cvar_SetValue( tiltMove->name, tiltMoveSpeed.value );
    
    if ( tiltMove->value == 100 ) {
		Cvar_SetValue( tiltMove->name, 0 );
        tiltMoveSpeed.value = tiltMove->value;
	}
	if ( tiltMove->value ) {
		Cvar_SetValue( tiltTurn->name, 0 );
        tiltTurnSpeed.value = tiltTurn->value;
	}
    */
    
    
}

- (IBAction) TiltTurnValChanged {
    /*Cvar_SetValue( tiltTurn->name, tiltTurnSpeed.value );
    
    if ( tiltTurn->value == 1500 ) {
		Cvar_SetValue( tiltTurn->name, 0 );
        tiltTurnSpeed.value = tiltTurn->value;
	}
	if ( tiltTurn->value ) {
		Cvar_SetValue( tiltMove->name, 0 );
        tiltMoveSpeed.value = tiltMove->value;
	}*/
}
@end
