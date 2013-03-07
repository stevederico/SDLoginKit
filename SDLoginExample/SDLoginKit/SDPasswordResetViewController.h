//
//  SDPasswordResetViewController.h
//  SDLoginKit
//
//  Created by Steve Derico on 2/28/13.
//  Copyright (c) 2013 OpCon. All rights reserved.
//

#import "SDPlaceholderCell.h"
#import "SDFooterButtonView.h"
#import <UIKit/UIKit.h>
@class SDPasswordResetViewController;

@protocol SDPasswordResetViewControllerDelegate <NSObject>
- (void)passwordResetViewController:(SDPasswordResetViewController*)passwordResetViewController resetPasswordWithEmail:(NSString*)email;
@end

@interface SDPasswordResetViewController : UITableViewController <UITextFieldDelegate>
@property (nonatomic, weak) id <SDPasswordResetViewControllerDelegate> delegate;
- (void)passwordResetViewControllerDidResetPassword;
- (void)passwordResetViewControllerFailedToResetPasswordWithError:(NSError*)error;
@end




