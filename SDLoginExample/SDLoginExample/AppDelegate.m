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
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    //Add SDLoginKit
    SDLoginViewController *loginViewController = [[SDLoginViewController alloc] init];
    loginViewController.logoImage = [UIImage imageNamed:@"superman"];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [self.window.rootViewController presentViewController:navController animated:YES completion:nil];

    return YES;
}

#pragma mark - SDLoginViewControllerDelegate

- (void)loginViewControllerAuthenticateWithCredential:(NSURLCredential*)credential{
    
    NSLog(@"Credential %@",[credential description]);

    [self loginViewControllerDidAuthenticateWithCredential:credential andResponse:nil];
    
    // Failure call loginViewControllerFailedToAuthenticateWithError with error to prompt
    NSDictionary *dictionaryUserInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"Alert Title", @"Title", @"Don't Forget to override loginViewControllerAuthenticateWithCredential :)", @"Message", nil];
    
    [self loginViewControllerFailedToAuthenticateWithError:[NSError errorWithDomain:@"SDLoginExample" code:410 userInfo:dictionaryUserInfo]];
     
    
    
}


- (void)loginViewControllerDidAuthenticateWithCredential:(NSURLCredential*)credential andResponse:(id)response{
    
    [self.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)loginViewControllerFailedToAuthenticateWithError:(NSError*)error{
    
    NSString *title = [[error.userInfo objectForKey:@"Title"] capitalizedString];
    NSString *message = [[error.userInfo objectForKey:@"Message"] capitalizedString];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}

@end
