//
//  SDSignUpViewController.h
//  SDLoginKit
//
//  Created by Steve Derico on 1/26/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//
#import "SDKit.h"

#import <UIKit/UIKit.h>

@protocol SDSignUpViewControllerDelegate <NSObject>

- (void)signUpViewControllerShouldBeginSignUp;
- (void)signUpViewControllerDidSuccessfullySignUpWithResponse:(id)response;
- (void)signUpViewControllerFailedToSignUpWithResponse:(id)response;

@end


@interface SDSignUpViewController : UITableViewController <SDSignUpViewControllerDelegate, UITextFieldDelegate>
@property (nonatomic, weak) id <SDSignUpViewControllerDelegate> delegate;
@property (strong, nonatomic)  UITextField *confirmField;
@property (strong, nonatomic)  UITextField *passwordField;
@property (strong, nonatomic)  UITextField *emailField;

@end

