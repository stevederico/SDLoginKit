//
//  SDTextFooterButtonView.h
//  SDKit
//
//  Created by Stephen Derico on 1/7/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 Options for the background color of the footer button.
 */
typedef enum {
    /** Green background color with white text*/
    SDFooterButtonStyleGreen,
    /** Gray background color with black text*/
    SDFooterButtonStyleGray,
    /** Red background color with white text*/
    SDFooterButtonStyleRed,
} SDFooterButtonStyle;

/**
 SDFooterButtonView
 
 Provides a UIButton inside a UIView, accessable through the `button` property.
 
 This is best used in the tandem with the tableView:viewForFooterInSection UITableViewDelegate method.
 
 - (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
 
 Button Title Text also includes a inverse shadow color.
 */

@interface SDTextFooterButtonView : UIView
///--------------------------------
/// @name Accessing the Footer Button
///--------------------------------

/**
 The footer button.
 */
@property (nonatomic, retain) UIButton *button;
@property (nonatomic, strong) UITextView *textView;

///---------------
/// @name Initialize With Style
///---------------

/**
 Initialize instance with specific SDFooterButtonStyle
 
 @return an instance of SDFooterButton
 */

- (id)initWithStyle:(SDFooterButtonStyle)style;
@end
