//
//  CreditsMenuController.h
//  Doom
//
//  Created by Matthieu DESILE on 3/10/13.
//
//

#import "MenuViewController.h"
#import "MetaViewController.h"

@interface CreditsMenuController : MenuViewController
- (id) initWithContainer: (MetaViewController*) container;
- (IBAction) backToMain: (id) sender;
@end
