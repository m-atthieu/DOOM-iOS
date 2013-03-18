//
//  LevelSelectController.h
//  Doom
//
//  Created by Matthieu DESILE on 3/10/13.
//
//

#import "MenuViewController.h"
#import "MetaViewController.h"
#import "UIFontButton.h"
#import "UIFontLabel.h"

enum skill_t {
    easy = 0,
    medium = 1,
    hard = 2,
    nightmare = 3
};

@interface LevelSelectController : MenuViewController
{

    IBOutlet UIScrollView* levelScroller;
    IBOutlet UIButton*     lastElement;

    IBOutlet UIImageView*   easySelection;
    IBOutlet UIImageView*   mediumSelection;
    IBOutlet UIImageView*   hardSelection;
    IBOutlet UIImageView*   NightmareSelection;
    
    IBOutlet UIFontLabel*  easySelectionLabel;
    IBOutlet UIFontLabel*  mediumSelectionLabel;
    IBOutlet UIFontLabel*  hardSelectionLabel;
    IBOutlet UIFontLabel*  nightmareSelectionLabel;

    IBOutlet UIFontButton* playButton;
    IBOutlet UIFontLabel*  playLabel;

    UIFontButton* selectedMap;
    int episodeSelected;
    int mapSelected;
    int levelSelected;
}

- (id)initWithContainer: (MetaViewController*) container;

- (IBAction) backToMain;
- (IBAction) Play;

- (IBAction)     UpMission;
- (IBAction)     DownMission;

// Difficulty Setting
- (IBAction)     EasyPressed;
- (IBAction)     MediumPressed;
- (IBAction)     HardPressed;
- (IBAction)     NightmarePressed;

// DOOM EPISODES
- (IBAction) selectLevel01;
- (IBAction) selectLevel02;
- (IBAction) selectLevel03;
- (IBAction) selectLevel04;
- (IBAction) selectLevel05;
- (IBAction) selectLevel06;
- (IBAction) selectLevel07;
- (IBAction) selectLevel08;
- (IBAction) selectLevel09;

- (IBAction) selectLevel10;
- (IBAction) selectLevel11;
- (IBAction) selectLevel12;
- (IBAction) selectLevel13;
- (IBAction) selectLevel14;
- (IBAction) selectLevel15;
- (IBAction) selectLevel16;
- (IBAction) selectLevel17;
- (IBAction) selectLevel18;
- (IBAction) selectLevel19;

- (IBAction) selectLevel20;
- (IBAction) selectLevel21;
- (IBAction) selectLevel22;
- (IBAction) selectLevel23;
- (IBAction) selectLevel24;
- (IBAction) selectLevel25;
- (IBAction) selectLevel26;
- (IBAction) selectLevel27;
- (IBAction) selectLevel28;
- (IBAction) selectLevel29;

- (IBAction) selectLevel30;
- (IBAction) selectLevel31;
- (IBAction) selectLevel32;
@end
