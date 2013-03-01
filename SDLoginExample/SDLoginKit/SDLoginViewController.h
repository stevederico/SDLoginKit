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

- (id)loginViewControllerShouldBeginLogin:(NSDictionary*)credentials;
- (void)loginViewControllerDidSuccessfullyLoginWithResponse:(id)response;
- (void)loginViewControllerFailedToLoginWithError:(NSError*)error;


@end

@interface SDLoginViewController : UITableViewController <UITextFieldDelegate, SDLoginViewControllerDelelgate>
@property (nonatomic, weak) id <SDLoginViewControllerDelelgate> delegate;
@property (nonatomic, strong) UIImage *logoImage;
+ (void)presentModalLoginViewControllerOnViewController:(UIViewController*)viewController withDelegate:(id)delegate;
@end

