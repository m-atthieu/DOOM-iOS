//
//  MetaViewController.m
//  Doom
//
//  Created by Matthieu DESILE on 3/6/13.
//
//
#import "../doomiphone.h"

#import "ControlsMenuController.h"
#import "GameViewController.h"
#import "LegalMenuController.h"
#import "LevelSelectController.h"
#import "MainMenuController.h"
#import "SettingsMenuController.h"

//#import "EAGLView.h"
//#import "ControlsMenuView.h"
//#import "MapMenuView.h"
//#import "SettingsMenuView.h"

#import "MetaViewController.h"

@interface MetaViewController ()
- (void) initDisplayLink;
- (void) initializeGameController;
- (MenuViewController*) mainMenu;
@end

@implementation MetaViewController

//@synthesize glView;
//@synthesize displayLink;

#pragma mark - life cycle

- (id) init
{
    self = [super initWithNibName: @"MetaView" bundle: [NSBundle mainBundle]];
    if (self) {
        // Custom initialization
        [self initializeGameController];
        //[self initializeGameView];
        [self initDisplayLink];
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self switchToMenu: main_menu];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc
{
    //[glView release];
    [super dealloc];
}

#pragma mark - contained controllers

- (MenuViewController*) mainMenu
{
    if(mainMenuViewController == nil){
        mainMenuViewController = [[MainMenuController alloc] initWithContainer: self];
    }
    return mainMenuViewController;
}

- (MenuViewController*) legalMenu
{
    if(legalMenuViewController == nil){
        legalMenuViewController = [[LegalMenuController alloc] initWithContainer: self];
    }
    return legalMenuViewController;
}

- (MenuViewController*) settingsMenu
{
    if(settingsMenuViewController == nil){
        settingsMenuViewController = [[SettingsMenuController alloc] initWithContainer: self];
    }
    return settingsMenuViewController;
}

- (MenuViewController*) levelMenu
{
    if(levelMenuViewController == nil){
        levelMenuViewController = [[LevelSelectController alloc] initWithContainer: self];
    }
    return levelMenuViewController;
}

- (MenuViewController*) controlMenu
{
    if(controlsMenuViewController == nil){
	controlsMenuViewController = [[ControlsMenuController alloc] initWithContainer: self];
    }
    return controlsMenuViewController;
}

- (void) initializeGameController
{
    if(gameViewController == nil){
        gameViewController = [[GameViewController alloc] init];
    }
}

/*- (EAGLView*) initializeGameView
{
    if(glView == nil){
        UIViewController* controller = [self gameController];
        glView = (EAGLView*) controller.view;
        //glView = [[EAGLView alloc] init];
    }
    return glView;
}*/

#pragma mark - container controller

- (void) switchToMenu: (enum controller_t) menu
{
    UIViewController* controller = nil;
    switch (menu) {
        case     main_menu: controller = [self mainMenu];       break;
        case    legal_menu: controller = [self legalMenu];      break;
        case settings_menu: controller = [self settingsMenu];   break;
        case    level_menu: controller = [self levelMenu];      break;
        case  control_menu: controller = [self controlMenu];    break;
        case  game_control: controller = gameViewController;    break;
        default: break;
    }
    [self displayContentController: controller];
    //[self cycleFromViewController: currentController toViewController: controller];
}

- (void) displayContentController: (UIViewController*) content
{
    [self addChildViewController: content];
    //content.view.frame = [self frameForContentController];
    [self.view addSubview: content.view];
    [content didMoveToParentViewController: self];
}

- (void) hideContentController: (UIViewController*) content
{
    [content willMoveToParentViewController: nil];
    [content.view removeFromSuperview];
    [content removeFromParentViewController];
}

/*- (void) cycleFromViewController: (UIViewController*) oldC
                toViewController: (UIViewController*) newC
{
    [oldC willMoveToParentViewController:nil];                        // 1
    [self addChildViewController: newC];
    
    newC.view.frame = [self newViewStartFrame];                       // 2
    CGRect endFrame = [self oldViewEndFrame];
    
    [self transitionFromViewController: oldC toViewController: newC   // 3
                              duration: 0.25 options:0
                            animations:^{
                                newC.view.frame = oldC.view.frame;                       // 4
                                oldC.view.frame = endFrame;
                            }
     
                            completion:^(BOOL finished) {
                                [oldC removeFromParentViewController];                   // 5
                                [newC didMoveToParentViewController:self];
                            }];
			    }*/

#pragma mark - orientation

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark - display link

- (void) pauseDisplayLink: (BOOL) pause
{
    [displayLink setPaused: pause];
}

- (void) initDisplayLink
{
    int animationFrameInterval = 2;
    displayLink = [CADisplayLink displayLinkWithTarget: gameViewController
                                              selector: @selector(runFrame)];
    [displayLink setFrameInterval: animationFrameInterval];
    [displayLink addToRunLoop: [NSRunLoop currentRunLoop]
                      forMode: NSDefaultRunLoopMode];
    [self pauseDisplayLink: YES];
}

#pragma mark - Switch between Controllers

#define __UNUSED__ NSLog(@"%s __unused__", __PRETTY_FUNCTION__)

- (void) PrepareForViewSwap
{
    __UNUSED__;
    [mainMenuViewController.view removeFromSuperview];
    [mapMenuViewController.view removeFromSuperview];
    [creditsMenuViewController.view removeFromSuperview];
    [legalMenuViewController.view removeFromSuperview];
    [settingsMenuViewController.view removeFromSuperview];
    [controlsMenuViewController.view removeFromSuperview];
    [episodeMenuViewController.view removeFromSuperview];
}

- (void) MainMenu
{
    [self switchToMenu: main_menu];
    iphonePauseMusic();
    
    [displayLink setPaused: YES];
    IBMenuVisible = YES;

    /*[self PrepareForViewSwap];
    
    // Switch to the Game View.
    MenuViewController* main = [self mainMenu];
    UIView* view = main.view;
    [self.view addSubview: view];*/
    //[window makeKeyAndVisible];
    
}

- (void) CreditsMenu
{
    [self switchToMenu: credits_menu];
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
    //[self PrepareForViewSwap];
    
    // Switch to the Game View.
    //[self.view addSubview: creditsMenuViewController.view];
    //[window makeKeyAndVisible];
    
    
    
}

- (void) LegalMenu
{
    [self switchToMenu: legal_menu];
    [displayLink setPaused: YES];
    IBMenuVisible = YES;

    //[self PrepareForViewSwap];
    
    // Switch to the Game View.
    //[self.view addSubview: legalMenuViewController.view];
    //[window makeKeyAndVisible];
}

#pragma mark - Submenus Actions

- (void) GotoSupport {
    
    SysIPhoneOpenURL("http://www.idsoftware.com/doom-classic/index.html");
    
}

- (void) idSoftwareApps {
    
    SysIPhoneOpenURL("http://itunes.com/apps/idsoftware");
}

#pragma mark Settings

- (void) ControlsMenu 
{
    [self switchToMenu: control_menu];
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
    /*[Self PrepareForViewSwap];
    
    ControlsMenuView * menu = (ControlsMenuView*) controlsMenuViewController.view;
    [ menu SetOptions];
    
    // Switch to the Game View.
    [self.view addSubview: controlsMenuViewController.view];
    //[window makeKeyAndVisible];
    
    */
    
}

- (void) SettingsMenu
{
    [self switchToMenu: settings_menu];
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
    /*SettingsMenuView * menu = (SettingsMenuView*) settingsMenuViewController.view;
    [menu resetSwitches];
    
    // Switch to the Game View.
    [self.view addSubview: settingsMenuViewController.view];
    //[window makeKeyAndVisible];
    
    */
}


#pragma mark Play

- (void) ResumeGame {
    
    ResumeGame();
    [self switchToMenu: game_control];
    [displayLink setPaused: NO];
    IBMenuVisible = NO;
}

/*- (void) DemoGame {
    
    StartDemoGame( false );
    
    // Switch to the Game View.
    //[self.view addSubview:glView];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: NO];
    IBMenuVisible = NO;
}*/

- (void) NewGame {
    [self switchToMenu: level_menu];
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
}

- (void) MultiplayerGame
{
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
    
    [self HideIB];
}

- (void) playMap: (int) dataset: (int) episode: (int) map: (int) skill {
    mapStart_t startmap;
    
    startmap.map = map;
    startmap.episode = episode;
    startmap.dataset = dataset;
    startmap.skill = skill;
    
    StartSinglePlayerGame( startmap );
    
    [self HideIB];
}


#pragma mark ??

- (void) HUDLayout 
{
    menuState = IPM_HUDEDIT;
    [self HideIB];
}

- (void) hideIBAndPause: (BOOL) pause
{
    [self switchToMenu: game_control];
    [displayLink setPaused: pause];
    IBMenuVisible = NO;
}

- (void) HideIB
{
    [self hideIBAndPause: NO];
}
@end
