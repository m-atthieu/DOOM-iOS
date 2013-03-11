//
//  Banner.h
//  Doom
//
//  Created by Matthieu DESILE on 3/9/13.
//
//

#import <UIKit/UIKit.h>

#import "UIFontLabel.h"
#import "UIFontButton.h"

@interface Banner_SubItem : UIFontButton
@end

@interface Banner_SubMenu: UIView
{
    BOOL isHidden;
}

- (void) Hide;
- (void) Show;

@end