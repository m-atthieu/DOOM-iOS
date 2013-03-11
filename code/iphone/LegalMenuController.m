//
//  LegalMenuController.m
//  Doom
//
//  Created by Matthieu DESILE on 3/10/13.
//
//

#import "LegalMenuController.h"
#import "MetaViewController.h"

@interface LegalMenuController ()

@end

@implementation LegalMenuController

- (id) initWithContainer: (MetaViewController*) container
{
    self = [super initWithNibName: @"LegalMenuView"
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

#pragma mark - IBActions

- (IBAction) backToMain:(id)sender
{
    [self.container switchToMenu: main_menu];
}
@end
