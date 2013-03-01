//
//  SDPatternCell.h
//  SDKit
//
//  Created by Steve Derico on 9/20/11.
//  Copyright 2011 Bixby Apps. All rights reserved.
//

#import "SDTextFieldCell.h"
#import <UIKit/UIKit.h>

/**
 SDPatternCell
 
 Provides two UIColor properties, accessable through the `firstColor` & `secondColor` properties.
 
 Once set the cells will alternate color when displayed in a UITableView
 
 The designated initializer for this class is initWithFirstColor:andSecondColor:andReuseIdentifier:
 
 The UITableViewCellStyle defaults to UITableViewCellStyleValue1 if init is called.
 */


@interface SDPatternCell : UITableViewCell
///--------------------------------
/// @name Setting the Pattern Colors
///--------------------------------

/**
 The First Color to be Displayed
 */

@property (nonatomic, strong) UIColor *firstColor;

/**
 The Second Color to be Displayed
 */
@property (nonatomic, strong) UIColor *secondColor;

///--------------------------------
/// @name Designated Initializer
///--------------------------------

/**
 Create an instance with two pattern colors and a resuse identifier
 */

- (id)initWithFirstColor:(UIColor*)firstColor andSecondColor:(UIColor*)secondColor andReuseIdentifier:(NSString*)reuseIdentifier;
@end
