//
//  SDSwitchCell.h
//  SDKit
//
//  Created by Steve Derico on 10/18/11.
//  Copyright 2011 Bixby Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 SDSwitchCell
 
 Provides a UISwitch inside a UITableViewCell, accessable through the native `switchItem` property.
 
 The UISwitch instance is aligned to the right side of the cell. 
 
 It is recommended you use the addTarget:action:forControlEvents: method to detect user input.
 
 The designated initializer for this class is initWithStyle:reuseIdentifier:
 */

@interface SDSwitchCell : UITableViewCell

///--------------------------------
/// @name Accessing the Switch
///--------------------------------

/**
 The UISwitch instance used to retrieve user input
 */

@property (nonatomic, retain) UISwitch *switchItem;

@end
