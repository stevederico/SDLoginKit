//
//  SDSmoothCell.m
//  SDKit
//
//  Created by Stephen Derico on 1/4/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "SDRoundedImageViewCell.h"

@implementation SDRoundedImageViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

        self.imageView.contentMode = UIViewContentModeScaleAspectFit; // This determines position of image
        self.imageView.clipsToBounds = YES;
        // Configure the view for the selected state
    
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat margin = self.imageView.frame.size.height * .15;
    self.imageView.frame = CGRectMake(
                                 self.imageView.frame.origin.x + margin, 
                                 self.imageView.frame.origin.y + margin/2, self.imageView.frame.size.height-margin, self.imageView.frame.size.height-margin);
    

    
    CALayer *l = [self.imageView layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:7.0];
    
    // You can even add a border
    [l setBorderWidth:.25];
    [l setBorderColor:[[UIColor blackColor] CGColor]];
    
}

@end
