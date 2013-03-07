//
//  AppDelegate.m
//  SDLoginExample
//
//  Created by Steve Derico on 1/27/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    //Add SDLoginKit
    SDLoginViewController *loginViewController = [[SDLoginViewController alloc] init];
    [loginViewController setDelegate:self];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [self.viewController presentViewController:navController animated:YES completion:nil];

    return YES;
}

#pragma mark - SDLoginViewControllerDelegate

- (void)loginViewController:(SDLoginViewController*)loginViewController authenticateWithCredential:(NSURLCredential*)credential{

    //if success
    [loginViewController loginViewControllerDidAuthenticate];
    
    //if failure
    //Pass Error with userInfoDictionary key set to message
    // NSString *message = @"Don't Forget to override authenticateWithCredential";
    //NSDictionary *userInfoDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:message, NSLocalizedRecoverySuggestionErrorKey , nil];
    //[loginViewController loginViewControllerFailedToAuthenticateWithError: [NSError errorWithDomain:@"SDLoginKit" code:nil userInfo:userInfoDictionary]];

}

- (void)signUpViewController:(SDSignUpViewController*)signUpViewController signUpWithCredentials:(NSDictionary*)credentials{

    //if success
    [signUpViewController signUpViewControllerDidSignUp];
    
    
    //if failure
    //Pass Error with userInfoDictionary key set to message
    // NSString *message = @"Don't Forget to override signUpWithCredentials";
    //NSDictionary *userInfoDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:message, NSLocalizedRecoverySuggestionErrorKey , nil];
    //[loginViewController loginViewControllerFailedToAuthenticateWithError: [NSError errorWithDomain:@"SDLoginKit" code:nil userInfo:userInfoDictionary]];
    
}

- (void)passwordResetViewController:(SDPasswordResetViewController *)passwordResetViewController resetPasswordWithEmail:(NSString *)email{

    [passwordResetViewController passwordResetViewControllerDidResetPassword];

}



@end
