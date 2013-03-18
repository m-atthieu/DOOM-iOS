//
//  GameViewController.m
//  Doom
//
//  Created by Matthieu DESILE on 3/10/13.
//
//

#import "EAGLView.h"
#import "GameViewController.h"
#import "doomiphone.h"

@interface GameViewController ()
- (void) intializeView;
@end

@implementation GameViewController

- (id)init
{
    //self = [super initWithNibName: @"GameView" bundle: [NSBundle mainBundle]];
    if (self = [super init]) {
        [self initializeView];
    }
    return self;
}

/*- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}*/

- (void) initializeView
{
    CGRect frame = CGRectMake(0, 0, 320, 480);
    self.view = [[EAGLView alloc] initWithFrame: frame];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) runFrame {
    iphoneAsyncTic();
	iphoneFrame();
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
