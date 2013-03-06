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
@synthesize loginViewController = _loginViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    //Add SDLoginKit
    self.loginViewController = [[SDLoginViewController alloc] init];
    [self.loginViewController setDelegate:self];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.loginViewController];
    [self.viewController presentViewController:navController animated:YES completion:nil];

    return YES;
}

#pragma mark - SDLoginViewControllerDelegate

- (void)loginViewController:(SDLoginViewController*)loginViewController authenticateWithCredential:(NSURLCredential*)credential{

    //if success
    [self.loginViewController loginViewControllerDidAuthenticate];
    
    //if failure
    NSString *message = [NSString stringWithFormat:@"HEY"];
    NSDictionary *userInfoDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:message, NSLocalizedRecoverySuggestionErrorKey , nil];
//
    [loginViewController loginViewControllerFailedToAuthenticateWithError: [NSError errorWithDomain:@"SDLoginKit" code:nil userInfo:userInfoDictionary]];

    
}

- (void)signUpViewController:(SDSignUpViewController*)signUpViewController signUpWithCredentials:(NSDictionary*)credentials{

  //if success
    [signUpViewController signUpViewControllerDidSignUp];
    
  //if failure
    [signUpViewController signUpViewControllerFailedToSignUpWithError:nil];
    

    

}



@end
