//
//  LevelSelectController.m
//  Doom
//
//  Created by Matthieu DESILE on 3/10/13.
//
//

#import "LevelSelectController.h"

@interface LevelSelectController ()
- (enum skill_t)  getSkill;
- (void) playMap : (int) dataset : (int) episode : (int) map;
- (void) resetDifficulty;

- (void) setEpisode: (int) episode;
@end

@implementation LevelSelectController

- (id)initWithContainer: (MetaViewController*) container
{
    self = [super initWithNibName: @"LevelMenuView"
                           bundle: [NSBundle mainBundle]];
    if (self) {
        [self setContainer: container];
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initialize
{
    [self resetDifficulty ];
    
    [levelScroller setContentSize:CGSizeMake(levelScroller.bounds.size.width, CGRectGetMaxY(lastElement.frame))];
        
    [ playButton setEnabled: NO ];
    [ playLabel setEnabled: NO ];
    
    selectedMap = nil;
    episodeSelected = -1;
    mapSelected = -1;
    
}

- (void) awakeFromNib
{
    [self initialize];
}

#pragma mark - 
- (enum skill_t)  getSkill {
    
    if( easySelection.hidden == NO ) {
        return easy;
    } else if( mediumSelection.hidden == NO ) {
        return medium;
    } else if( hardSelection.hidden == NO ) {
        return hard;
    } else if( NightmareSelection.hidden == NO ) {
        return nightmare;
    }
    
    return easy;
}

- (void) resetDifficulty {
    
    easySelection.hidden        = NO;
    easySelectionLabel.hidden   = NO;
    mediumSelection.hidden      = YES;
    mediumSelectionLabel.hidden = YES;
    hardSelection.hidden        = YES;
    hardSelectionLabel.hidden   = YES;
    NightmareSelection.hidden   = YES;
    nightmareSelectionLabel.hidden = YES;
    
}

- (void) setEpisode: (int) episode {
    
    levelScroller.alpha = 1.0f;
}

#pragma mark - IBActions
- (IBAction) backToMain
{
    // Go Back to MainMenu.
    [self.container switchToMenu: main_menu];
    
    //Sound_StartLocalSound( "iphone/controller_down_01_SILENCE.wav" );
    
}



- (IBAction) UpMission
{
    CGFloat xOffset = levelScroller.contentOffset.x;
    CGFloat yOffset = levelScroller.contentOffset.y;
    
    if (levelScroller.contentOffset.y > 10 ){
        [levelScroller setContentOffset: CGPointMake(xOffset, yOffset - 50 ) animated:YES];
    }
}

- (IBAction) DownMission
{
    CGFloat xOffset = levelScroller.contentOffset.x;
    CGFloat yOffset = levelScroller.contentOffset.y;
    
    if (levelScroller.contentOffset.y < 300 ){
        [levelScroller setContentOffset: CGPointMake(xOffset, yOffset + 50 ) animated:YES];
    }
    
}

- (IBAction) Play
{
    
    int skillLevel = [self getSkill];
    
    //[self.container playMap: 0: episodeSelected: mapSelected: skillLevel ];
    [self.container playMap: 0 : 1 : 1 : skillLevel ];
    
}

// Difficulty Setting
-(IBAction)     EasyPressed {
    
    [self resetDifficulty];
    
    Sound_StartLocalSound( "iphone/controller_down_01_SILENCE.wav" );
}

-(IBAction)     MediumPressed {
    
    easySelection.hidden        = YES;
    mediumSelection.hidden      = NO;
    hardSelection.hidden        = YES;
    NightmareSelection.hidden   = YES;
    
    easySelectionLabel.hidden   = YES;
    mediumSelectionLabel.hidden = NO;
    hardSelectionLabel.hidden   = YES;
    nightmareSelectionLabel.hidden = YES;
    
    Sound_StartLocalSound( "iphone/controller_down_01_SILENCE.wav" );
    
}

- (IBAction) HardPressed
{
         easySelection.hidden = YES;
       mediumSelection.hidden = YES;
         hardSelection.hidden =  NO;
    NightmareSelection.hidden = YES;
    
         easySelectionLabel.hidden = YES;
       mediumSelectionLabel.hidden = YES;
         hardSelectionLabel.hidden =  NO;
    nightmareSelectionLabel.hidden = YES;
    
    Sound_StartLocalSound( "iphone/controller_down_01_SILENCE.wav" );
}

-(IBAction)     NightmarePressed{
    
    easySelection.hidden        = YES;
    mediumSelection.hidden      = YES;
    hardSelection.hidden        = YES;
    NightmareSelection.hidden   = NO;
    
    easySelectionLabel.hidden   = YES;
    mediumSelectionLabel.hidden = YES;
    hardSelectionLabel.hidden   = YES;
    nightmareSelectionLabel.hidden = NO;
    
    Sound_StartLocalSound( "iphone/controller_down_01_SILENCE.wav" );
}

- (void) selectLevel: (int) level
//- (void) playMap: (int) dataset: (int) episode: (int) map
{
    [ playButton setEnabled: YES ];
    [ playLabel setEnabled: YES ];
    
    if( selectedMap != nil ) {
        [ selectedMap setEnabled: YES ];
    }
    
    //selectedMap = (UIFontButton *)[ self viewWithTag: mapTag ];
    //[selectedMap setEnabled: NO];
    
    Sound_StartLocalSound( "iphone/controller_down_01_SILENCE.wav" );
}

- (IBAction) selectLevel01 { [self selectLevel:  1]; }
- (IBAction) selectLevel02 { [self selectLevel:  2]; }
- (IBAction) selectLevel03 { [self selectLevel:  3]; }
- (IBAction) selectLevel04 { [self selectLevel:  4]; }
- (IBAction) selectLevel05 { [self selectLevel:  5]; }
- (IBAction) selectLevel06 { [self selectLevel:  6]; }
- (IBAction) selectLevel07 { [self selectLevel:  7]; }
- (IBAction) selectLevel08 { [self selectLevel:  8]; }
- (IBAction) selectLevel09 { [self selectLevel:  9]; }

- (IBAction) selectLevel10 { [self selectLevel: 10]; }
- (IBAction) selectLevel11 { [self selectLevel: 11]; }
- (IBAction) selectLevel12 { [self selectLevel: 12]; }
- (IBAction) selectLevel13 { [self selectLevel: 13]; }
- (IBAction) selectLevel14 { [self selectLevel: 14]; }
- (IBAction) selectLevel15 { [self selectLevel: 15]; }
- (IBAction) selectLevel16 { [self selectLevel: 16]; }
- (IBAction) selectLevel17 { [self selectLevel: 17]; }
- (IBAction) selectLevel18 { [self selectLevel: 18]; }
- (IBAction) selectLevel19 { [self selectLevel: 19]; }

- (IBAction) selectLevel20 { [self selectLevel: 20]; }
- (IBAction) selectLevel21 { [self selectLevel: 21]; }
- (IBAction) selectLevel22 { [self selectLevel: 22]; }
- (IBAction) selectLevel23 { [self selectLevel: 23]; }
- (IBAction) selectLevel24 { [self selectLevel: 24]; }
- (IBAction) selectLevel25 { [self selectLevel: 25]; }
- (IBAction) selectLevel26 { [self selectLevel: 26]; }
- (IBAction) selectLevel27 { [self selectLevel: 27]; }
- (IBAction) selectLevel28 { [self selectLevel: 28]; }
- (IBAction) selectLevel29 { [self selectLevel: 29]; }

- (IBAction) selectLevel30 { [self selectLevel: 30]; }
- (IBAction) selectLevel31 { [self selectLevel: 31]; }
- (IBAction) selectLevel32 { [self selectLevel: 32]; }

@end
