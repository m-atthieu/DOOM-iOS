/*
 =======================================================================================
 
 Copyright (C) 2009-2011 id Software LLC, a ZeniMax Media company.  All Right Reserved.
 
 This file is part of the DOOM Classic iOS v2.1 GPL Source Code.
 
 =======================================================================================
 */

#import "ControlsMenuView.h"

@implementation ControlsMenuView

- (id) initWithCoder: (NSCoder*) aCoder
{
    if(self = [super initWithCoder: aCoder] ) {
        [self initialize];
    }
    return self;
}

- (id) initWithFrame: (CGRect) rect
{
    if(self = [super initWithFrame: rect] ) {
        [self initialize];
    }
    return self;
}

- (void) awakeFromNib
{
    [self initialize];
}

#pragma mark - 
- (void) SetupSlider: (UISlider*) slider 
	minimumTrack: (UIImage*) minImage
        maximumTrack: (UIImage*) maxImage
               thumb: (UIImage*) thumbImage
{
	[slider setMinimumTrackImage: minImage forState: UIControlStateNormal];
	[slider setMaximumTrackImage: maxImage forState: UIControlStateNormal];
    
	[slider setThumbImage: thumbImage forState: UIControlStateNormal];
	[slider setThumbImage: thumbImage forState: UIControlStateHighlighted];
}

- (void) initialize
{
    // Minimum track image setup.
    UIImage* minimumTrackImage = [UIImage imageNamed: @"SliderBar.png"];
    CGFloat minimumTrackImageCap = minimumTrackImage.size.width * 0.5f;
    
    UIImage* minimumTrackImageCapped = [minimumTrackImage stretchableImageWithLeftCapWidth: minimumTrackImageCap 
									      topCapHeight: 0.0f];
    
    
    // Maximum track image setup.
    UIImage* maximumTrackImage = [UIImage imageNamed: @"SliderBackground.png"];
    CGFloat maximumTrackImageCap = maximumTrackImage.size.width * 0.5f;
    
    UIImage* maximumTrackImageCapped = [maximumTrackImage stretchableImageWithLeftCapWidth: maximumTrackImageCap 
									      topCapHeight: 0.0f];
    
    // Thumb image.
    UIImage* thumbImage = [UIImage imageNamed: @"SliderSkull.png"];
    
    // Set up slider instances.
    [self SetupSlider: movestickSize
	 minimumTrack: minimumTrackImageCapped
	 maximumTrack: maximumTrackImageCapped
		thumb: thumbImage];
      
    [self SetupSlider: turnstickSize
	 minimumTrack: minimumTrackImageCapped
	 maximumTrack: maximumTrackImageCapped
		thumb: thumbImage];
      
    [self SetupSlider: tiltMoveSpeed
	 minimumTrack: minimumTrackImageCapped
	 maximumTrack: maximumTrackImageCapped
		thumb: thumbImage];
      
    [self SetupSlider: tiltTurnSpeed
	 minimumTrack: minimumTrackImageCapped
	 maximumTrack: maximumTrackImageCapped
		thumb: thumbImage];
}
@end
