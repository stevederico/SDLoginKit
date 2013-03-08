//
//  ViewController.m
//  SDLoginExample
//
//  Created by Steve Derico on 1/27/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.view.hidden == NO) {
        self.view.hidden = YES;
    }else{
        self.view.hidden = NO;
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)againTapped:(id)sender {
    self.view.hidden = YES;
    //Add SDLoginKit
    SDLoginViewController *loginViewController = [[SDLoginViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [loginViewController setDelegate:(AppDelegate*)[[UIApplication sharedApplication] delegate]];
    [loginViewController setLogoImage:[UIImage imageNamed:@"logo"]];
    [self presentViewController:navController animated:YES completion:nil];
}
@end
