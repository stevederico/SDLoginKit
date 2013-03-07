//
//  SDPasswordResetViewController.m
//  SDLoginKit
//
//  Created by Steve Derico on 2/28/13.
//  Copyright (c) 2013 OpCon. All rights reserved.
//

#import "SDPasswordResetViewController.h"

@interface SDPasswordResetViewController ()
@property(nonatomic,strong) UITextField *emailField;

@end

@implementation SDPasswordResetViewController

@synthesize delegate = _delegate;

- (id)init{
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    self.title = @"Forgot Password?";
    
    return self;
}



- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    SDPlaceholderCell *cell = (SDPlaceholderCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell.textField becomeFirstResponder];
    
    [UIView commitAnimations];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
 
    // Configure the cell...
    
    SDPlaceholderCell *cell = (SDPlaceholderCell*)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[SDPlaceholderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textField.delegate = self;
        [cell.textField setReturnKeyType:UIReturnKeyGo];
        [cell.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    }
    
    cell.textField.tag = indexPath.row;
    cell.textField.placeholder = @"Email";
    self.emailField = cell.textField;

    return cell;
}


#pragma mark - Table view delegate

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    SDFooterButtonView *footerView = [[SDFooterButtonView alloc] initWithStyle:SDFooterButtonStyleGreen];
    [footerView.button setTitle:@"Send Reset Email" forState:UIControlStateNormal];
    [footerView.button addTarget:self action:@selector(didTapSendReset) forControlEvents:UIControlEventTouchUpInside];
    return footerView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 75;
}

#pragma mark - SDPasswordResetViewController

- (void)passwordResetViewControllerDidResetPassword{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Sent" message:@"A Password Reset Link Has Been Sent to Your Email Address." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}
- (void)passwordResetViewControllerFailedToResetPasswordWithError:(NSError*)error{
    
    NSString *message = [[error localizedRecoverySuggestion] capitalizedString];
    
    NSLog(@"Failed! %@", message);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];


}

- (void)didTapSendReset{
    [self.delegate passwordResetViewController:self resetPasswordWithEmail:self.emailField.text];
}


@end
