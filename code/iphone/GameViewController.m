//
//  GameViewController.m
//  Doom
//
//  Created by Matthieu DESILE on 3/10/13.
//
//

#import "GameViewController.h"
#import "doomiphone.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)init
{
    self = [super initWithNibName: @"GameView" bundle: [NSBundle mainBundle]];
    if (self) {
        // Custom initialization
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

- (void) runFrame {
    iphoneAsyncTic();
	iphoneFrame();
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
