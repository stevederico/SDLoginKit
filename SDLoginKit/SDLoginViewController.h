//
//  SDLoginViewController.h
//  SDLoginKit
//
//  Created by Steve Derico on 1/26/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//

#import "SDSignUpViewController.h"
#import <UIKit/UIKit.h>

@protocol SDLoginViewControllerDelelgate <NSObject>

- (void)loginViewControllerShouldBeginLogin:(NSDictionary*)credentials;
- (void)loginViewControllerDidSuccessfullyLoginWithResponse:(id)response;
- (void)loginViewControllerFailedToLoginWithResponse:(id)response;


@end

@interface SDLoginViewController : UITableViewController <UITextFieldDelegate, SDLoginViewControllerDelelgate>
@property (nonatomic, weak) id <SDLoginViewControllerDelelgate> delegate;
@property (nonatomic, strong) UIImage *logoImage;
@end

