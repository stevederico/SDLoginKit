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

- (id)signUpViewControllerShouldBeginSignUp:(NSDictionary*)credentials;
- (void)signUpViewControllerDidSuccessfullySignUpWithResponse:(id)response;
- (void)signUpViewControllerFailedToSignUpWithError:(NSError*)error;

@end


@interface SDSignUpViewController : UITableViewController <SDSignUpViewControllerDelegate, UITextFieldDelegate>
@property (nonatomic, weak) id <SDSignUpViewControllerDelegate> delegate;

- (id)initWithArrayOfFields:(NSArray*)fields;
@end

