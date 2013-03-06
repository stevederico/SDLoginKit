    //
    //  SDSignUpViewController.h
    //  SDLoginKit
    //
    //  Created by Steve Derico on 1/26/13.
    //  Copyright (c) 2013 Bixby Apps. All rights reserved.
    //
#import "SDKit.h"

#import <UIKit/UIKit.h>
@class SDSignUpViewController;


@protocol SDSignUpViewControllerDelegate <NSObject>
- (void)signUpViewController:(SDSignUpViewController*)signUpViewController signUpWithCredentials:(NSDictionary*)credentials;
@end


@interface SDSignUpViewController : UITableViewController <UITextFieldDelegate>
@property (nonatomic, weak) id <SDSignUpViewControllerDelegate> delegate;

- (id)initWithArrayOfFields:(NSArray*)fields;
- (void)signUpViewControllerDidSignUp;
- (void)signUpViewControllerFailedToSignUpWithError:(NSError*)error;
@end

