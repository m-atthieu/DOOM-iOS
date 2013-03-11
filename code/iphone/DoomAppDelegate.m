/*
 Copyright (C) 2009-2011 id Software LLC, a ZeniMax Media company.
 Copyright (C) 2009 Id Software, Inc.
 
 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation; either version 2
 of the License, or (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 
 */

#import <AudioToolbox/AudioServices.h>

#include "../doomiphone.h"

#import "DoomAppDelegate.h"
//#import "EAGLView.h"
//#import "SettingsMenuView.h"
//#import "ControlsMenuView.h"
#include "IBGlue.h"
//#import "MapMenuView.h"

@interface UIApplication (Private)
- (void) setSystemVolumeHUDEnabled: (BOOL) enabled forAudioCategory: (NSString*) category;
- (void) setSystemVolumeHUDEnabled: (BOOL) enabled;
- (void) runFrame;
- (void) asyncTic;
@end

char iphoneDocDirectory[1024];
char iphoneAppDirectory[1024];

@implementation DoomAppDelegate

@synthesize window;
@synthesize controller;

//extern	EAGLContext *context;

//DoomAppDelegate * gAppDelegate = NULL;

NSTimer *animationTimer;
bool inBackgroundProcess = false;

touch_t		sysTouches[MAX_TOUCHES];
touch_t		gameTouches[MAX_TOUCHES];
pthread_mutex_t	eventMutex;		// used to sync between game and event threads
bool        firstRun = true;

volatile boolean startupCompleted;

- (void) asyncTic {
	iphoneAsyncTic();
	[self restartAccelerometerIfNeeded];
}

- (void) applicationDidFinishLaunching: (UIApplication*) application {
    inBackgroundProcess = false;
	application.statusBarHidden = YES;
	application.statusBarOrientation = UIInterfaceOrientationLandscapeLeft;
	//gAppDelegate = self;
    
	// get the documents directory, where we will write configs and save games
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex: 0];
	[documentsDirectory getCString: iphoneDocDirectory 
                         maxLength: sizeof(iphoneDocDirectory) - 1
                          encoding: NSASCIIStringEncoding];
	
	// disable screen dimming
	[UIApplication sharedApplication].idleTimerDisabled = YES;
	
    // Add the Main Menu as the SubView
    self.window = [[[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]] autorelease];
    self.controller = [[MetaViewController alloc] init];
    [self.window setRootViewController: controller];
    [self.window makeKeyAndVisible];
    
	// start the flow of accelerometer events
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.delegate = self;
	accelerometer.updateInterval = 1.0f / 30.0f;

	// use this mutex for coordinating touch handling between
	// the run loop thread and the game thread
	if ( pthread_mutex_init( &eventMutex, NULL ) == -1 ) {
		perror( "pthread_mutex_init" );
	}
	
	// use this semaphore for signaling from the async cmd generation thread that
	// the game / draw thread can wake up

	// sem_init is unimplemented on iPhone
	//if ( sem_init( &ticSemaphore, 0, 0 ) == -1 ) {
	//	perror( "sem_init" );
	//}
	ticSemaphore = sem_open( "ticSemaphore", O_CREAT, S_IRWXU, 0 );
	if ( ticSemaphore == SEM_FAILED ) {
		perror( "sem_open" );
	}
	
	// we want the main (event/async) thread to be as high a priority as possible
	// so the game/render thread will be interrupted immediately.
	// It looks like the default scheduling on iPhone is already what we want --
	// the main thread is at 1.0, and new threads are at 0.5.
	printf("original event thread priority: %f\n", (float)[NSThread threadPriority] );
	[NSThread setThreadPriority: 1.0];
	printf("new event thread priority: %f\n", (float)[NSThread threadPriority] );
	
    // do all the game startup work
	iphoneStartup();
    
    startupCompleted = TRUE;	// OK to start touch / accel callbacks
}


- (void) applicationWillResignActive: (UIApplication *)application {
    [self.controller pauseDisplayLink: YES];
    inBackgroundProcess = YES;
    iphonePauseMusic();
    iphoneShutdown();
}


- (void) applicationDidBecomeActive:(UIApplication *)application {
    [self.controller pauseDisplayLink: NO];
    inBackgroundProcess = NO;
    
    /*if( IBMenuVisible && !firstRun ) {
        iphonePlayMusic( "intro" );
    }*/
    
    firstRun = false;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    iphoneStopMusic();
	iphoneShutdown();
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	Com_Printf( "applicationDidReceiveMemoryWarning\n" );
}

- (void)dealloc {
	[window release];
	
	[super dealloc];
}

#pragma mark - accelerometer

- (void)restartAccelerometerIfNeeded {

	// I have no idea why this seems to happen sometimes...
	if ( SysIphoneMilliseconds() - lastAccelUpdateMsec > 1000 ) {
		static int count;
		if ( ++count < 100 ) {
			printf( "Restarting accelerometer updates.\n" );
		}
		UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
		accelerometer.delegate = self;
		accelerometer.updateInterval = 0.01;
	}
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{	
	float acc[4];
	acc[0] = acceleration.x;
	acc[1] = acceleration.y;
	acc[2] = acceleration.z;
	acc[3] = acceleration.timestamp;
	iphoneTiltEvent( acc );
	lastAccelUpdateMsec = SysIphoneMilliseconds();
}


@end



