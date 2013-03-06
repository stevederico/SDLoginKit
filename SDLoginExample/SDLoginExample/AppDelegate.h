//
//  AppDelegate.h
//  SDLoginExample
//
//  Created by Steve Derico on 1/27/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//
#import "SDLoginKit.h"
#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, SDLoginViewControllerDelelgate, SDSignUpViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic, strong) SDLoginViewController *loginViewController;

@end
