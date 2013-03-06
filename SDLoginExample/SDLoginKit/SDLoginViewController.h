//
//  SDLoginViewController.h
//  SDLoginKit
//
//  Created by Steve Derico on 1/26/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//


#import "SDPasswordResetViewController.h"
#import "SDSignUpViewController.h"
#import <UIKit/UIKit.h>
@class SDLoginViewController;

@protocol SDLoginViewControllerDelelgate <NSObject>
- (void)loginViewController:(SDLoginViewController*)loginViewController authenticateWithCredential:(NSURLCredential*)credential;
@end


@interface SDLoginViewController : UITableViewController <UITextFieldDelegate>
@property (nonatomic, weak) id <SDLoginViewControllerDelelgate, SDSignUpViewControllerDelegate> delegate;
@property (nonatomic, strong) UIImage *logoImage;

- (void)loginViewControllerDidAuthenticate;
- (void)loginViewControllerFailedToAuthenticateWithError:(NSError*)error;
@end

