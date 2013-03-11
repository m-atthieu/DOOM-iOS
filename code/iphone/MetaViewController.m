//
//  MetaViewController.m
//  Doom
//
//  Created by Matthieu DESILE on 3/6/13.
//
//
#import "../doomiphone.h"

#import "GameViewController.h"
#import "LegalMenuController.h"
#import "LevelSelectController.h"
#import "MainMenuController.h"
#import "SettingsMenuController.h"
#import "EAGLView.h"
//#import "ControlsMenuView.h"
//#import "MapMenuView.h"
//#import "SettingsMenuView.h"

#import "MetaViewController.h"

@interface MetaViewController ()
- (void) initDisplayLink;
- (MenuViewController*) mainMenu;
@end

@implementation MetaViewController

@synthesize glView;
@synthesize displayLink;

#pragma mark - life cycle

- (id) init
{
    self = [super initWithNibName: @"MetaView" bundle: [NSBundle mainBundle]];
    if (self) {
        // Custom initialization
        [self initializeGameView];
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
    [glView release];
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

- (UIViewController*) gameController
{
    if(gameViewController == nil){
        gameViewController = [[GameViewController alloc] init];
    }
    return gameViewController;
}

- (EAGLView*) initializeGameView
{
    if(glView == nil){
        UIViewController* controller = [self gameController];
        glView = (EAGLView*) controller.view;
        //glView = [[EAGLView alloc] init];
    }
    return glView;
}

#pragma mark - container controller

- (void) switchToMenu: (enum controller_t) menu
{
    UIViewController* controller = nil;
    switch (menu) {
        case     main_menu: controller = [self mainMenu];       break;
        case    legal_menu: controller = [self legalMenu];      break;
        case settings_menu: controller = [self settingsMenu];   break;
        case    level_menu: controller = [self levelMenu];      break;
        case  game_control: controller = [self gameController]; break;
        default: break;
    }
    [self displayContentController: controller];
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

/*
- (void) cycleFromViewController: (UIViewController*) oldC
                toViewController: (UIViewController*) newC
{
    [oldC willMoveToParentViewController:nil];                        // 1
    [self addChildViewController:newC];
    
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
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

#pragma mark - 

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

- (void) ResumeGame {
    
    ResumeGame();
    [self switchToMenu: game_control];
    return;
    // Switch to the Game View.
    [self.view addSubview: glView];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: NO];
    IBMenuVisible = NO;
}

- (void) MainMenu {
    
    [self PrepareForViewSwap];
    
    // Switch to the Game View.
    MenuViewController* main = [self mainMenu];
    UIView* view = main.view;
    [self.view addSubview: view];
    //[window makeKeyAndVisible];
    iphonePauseMusic();
    
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
}

- (void) DemoGame {
    
    StartDemoGame( false );
    
    // Switch to the Game View.
    [self.view addSubview:glView];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: NO];
    IBMenuVisible = NO;
}

- (void) NewGame {
    [self switchToMenu: level_menu];
    return;
    [self PrepareForViewSwap];
    
    // Switch to the Game View.
    [self.view addSubview: episodeMenuViewController.view];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
    
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

- (void) CreditsMenu {
    
    [self PrepareForViewSwap];
    
    // Switch to the Game View.
    [self.view addSubview: creditsMenuViewController.view];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
    
}

- (void) LegalMenu {
    
    [self PrepareForViewSwap];
    
    // Switch to the Game View.
    [self.view addSubview: legalMenuViewController.view];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
    
}

- (void) GotoSupport {
    
    SysIPhoneOpenURL("http://www.idsoftware.com/doom-classic/index.html");
    
}

- (void) idSoftwareApps {
    
    SysIPhoneOpenURL("http://itunes.com/apps/idsoftware");
}

- (void) ControlsMenu {
    
    /*[self PrepareForViewSwap];
    
    ControlsMenuView * menu = (ControlsMenuView*) controlsMenuViewController.view;
    [ menu SetOptions];
    
    // Switch to the Game View.
    [self.view addSubview: controlsMenuViewController.view];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: YES];
    IBMenuVisible = YES;*/
    
}

- (void) SettingsMenu {
    
    [self PrepareForViewSwap];
    
    /*SettingsMenuView * menu = (SettingsMenuView*) settingsMenuViewController.view;
    [menu resetSwitches];
    
    // Switch to the Game View.
    [self.view addSubview: settingsMenuViewController.view];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
    */
}

- (void) HUDLayout {
    
    menuState = IPM_HUDEDIT;
    
    [self HideIB];
}

- (void) HideIB {
    
    [self PrepareForViewSwap];
    
    // Switch to the Game View.
    [self.view addSubview: glView];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: NO];
    IBMenuVisible = NO;
}

- (void) SelectEpisode: (int) episode {
    
    /*[self PrepareForViewSwap];
    
    [ (MapMenuView*)mapMenuViewController.view setEpisode: episode ];
    
    // Switch to the Game View.
    [self.view addSubview: mapMenuViewController.view];
    //[window makeKeyAndVisible];
    
    [displayLink setPaused: YES];
    IBMenuVisible = YES;
    */
}

@end
