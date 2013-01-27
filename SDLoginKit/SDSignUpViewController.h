//
//  SDSignUpViewController.h
//  SDLoginKit
//
//  Created by Steve Derico on 1/26/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//
#import "SDKit.h"

#import <UIKit/UIKit.h>

@protocol SignUpViewControllerDelegate <NSObject>

- (void)signUpViewControllerShouldBeginSignUp;
- (void)signUpViewControllerDidSuccessfullyLoginWithResponse:(id)response;
- (void)signUpViewControllerFailedToLoginWithResponse:(id)response;

@end


@interface SDSignUpViewController : UITableViewController <SignUpViewControllerDelegate, UITextFieldDelegate>
@property (nonatomic, weak) id <SignUpViewControllerDelegate> delegate;
@property (strong, nonatomic)  UITextField *confirmField;
@property (strong, nonatomic)  UITextField *passwordField;
@property (strong, nonatomic)  UITextField *emailField;

@end

