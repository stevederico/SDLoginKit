//
//  SDFooterButton.m
//  SDKit
//
//  Created by Stephen Derico on 1/7/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//

#import "SDFooterButtonView.h"

@implementation SDFooterButtonView
@synthesize button = _button;

- (id)init {
    self = [super initWithFrame:CGRectMake(0, 0, 320, 175)];
    if (self) {
        self.button= [UIButton buttonWithType:UIButtonTypeRoundedRect];     
        [self.button setTitle:@"Sample Text" forState:UIControlStateNormal];
        self.button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:23];
    

        [self.button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
        [[self.button titleLabel] setShadowOffset:CGSizeMake(0, -.50f)];

                
        //Default Button
        [self.button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.button setBackgroundImage:[UIImage imageNamed:@"green.png"] forState:UIControlStateNormal];
        
        [self addSubview: self.button];
    }
    return self;
}

- (id)initWithStyle:(SDFooterButtonStyle)style{
    self = [self init];
    
        if (style == SDFooterButtonStyleGreen) {
            [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.button setBackgroundImage:[UIImage imageNamed:@"green.png"] forState:UIControlStateNormal];
        }else if (style == SDFooterButtonStyleGray){
            [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [[self.button titleLabel] setShadowOffset:CGSizeMake(0, 1.0f)];
            [self.button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateHighlighted];
             [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

            [self.button setBackgroundImage:[UIImage imageNamed:@"gray.png"] forState:UIControlStateNormal];

        }else if (style == SDFooterButtonStyleRed){
            [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.button setBackgroundImage:[UIImage imageNamed:@"red.png"] forState:UIControlStateNormal];
            
        }
    
    return self;
}


- (void) layoutSubviews {
    [super layoutSubviews];
    self.button.frame = CGRectMake(10, 10, self.bounds.size.width - 10 - 10, 45);
}




@end
