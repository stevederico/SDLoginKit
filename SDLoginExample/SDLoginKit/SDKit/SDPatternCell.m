//
//  SDPatternCell.m
//  SDKit
//
//  Created by Steve Derico on 9/20/11.
//  Copyright 2011 Bixby Apps. All rights reserved.
//

#import "SDPatternCell.h"

@implementation SDPatternCell
@synthesize firstColor = _firstColor, secondColor = _secondColor;

- (id)init {
    self = [self initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];

    return self;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.textLabel.textColor  = [UIColor blackColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.textColor = [UIColor blackColor];
        self.textLabel.shadowColor = [UIColor whiteColor];
        self.textLabel.shadowOffset = CGSizeMake(0.0, 1.0);
        self.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16.0];
        
        self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;

        self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;

        self.textLabel.numberOfLines = 0;
        self.firstColor = [UIColor colorWithRed:173.0f/255.0f green:173.0f/255.0f blue:176.0f/255.0f alpha:1.0f];
        self.secondColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:216.0f/255.0f alpha:1.0f];
    }
    return self;

}


- (id)initWithFirstColor:(UIColor*)firstColor andSecondColor:(UIColor*)secondColor andReuseIdentifier:(NSString*)reuseIdentifier{
    self = [self initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    
    self.firstColor = firstColor;
    self.secondColor = secondColor;
    
    return self;

}


-(void)drawRect:(CGRect)rect  {
    [super drawRect:rect];
    
    if ( [[(UITableView*)[self superview] indexPathForCell:self] row] % 2) {
        [self setBackgroundColor:self.firstColor];
    } else {
        [self setBackgroundColor:self.secondColor]; 
    }
    


}

@end
