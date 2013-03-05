//
//  SDLoginViewController.h
//  SDLoginKit
//
//  Created by Steve Derico on 1/26/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//
#import "MBProgressHUD.h"
#import "SDPasswordResetViewController.h"
#import "SDSignUpViewController.h"
#import <UIKit/UIKit.h>

@protocol SDLoginViewControllerDelelgate <NSObject>
- (void)loginViewControllerAuthenticateWithCredential:(NSURLCredential*)credential;
- (void)loginViewControllerDidAuthenticateWithCredential:(NSURLCredential*)credential andResponse:(id)response;
- (void)loginViewControllerFailedToAuthenticateWithError:(NSError*)error;

@end


@interface SDLoginViewController : UITableViewController <UITextFieldDelegate, SDLoginViewControllerDelelgate>
@property (nonatomic, weak) id <SDLoginViewControllerDelelgate, SDSignUpViewControllerDelegate> delegate;
@property (nonatomic, strong) UIImage *logoImage;
+ (void)presentModalLoginViewControllerOnViewController:(UIViewController*)viewController withDelegate:(id)delegate;
@end

