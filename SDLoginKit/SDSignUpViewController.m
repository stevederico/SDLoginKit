//
//  SDSignUpViewController.m
//  SDLoginKit
//
//  Created by Steve Derico on 1/26/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//

#import "SDSignUpViewController.h"

@interface SDSignUpViewController ()

@end

@implementation SDSignUpViewController
@synthesize delegate = _delegate;
@synthesize confirmField = _confirmField, passwordField = _passwordField, emailField = _emailField;

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
        self.title = @"Sign Up";
        self.delegate = self;
    }
    return self;
}

- (void)loadView{
    
    [super loadView];

    [self.emailField becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    [self.emailField becomeFirstResponder];
    
    [UIView commitAnimations];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setConfirmField:nil];
    [self setPasswordField:nil];
    [self setEmailField:nil];
    [super viewDidUnload];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == _confirmField) {
        [self.delegate signUp];
    }else if (textField == _emailField) {
        [self.passwordField becomeFirstResponder];
    }else{
        [self.confirmField becomeFirstResponder];
    }
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifer = @"CellIdentifer";
    
    SDPlaceholderCell *cell = (SDPlaceholderCell*)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[SDPlaceholderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        cell.textField.delegate = self;
    }
    
    if (indexPath.row == 0) {
        [cell.textField setPlaceholder:@"Email"];
        self.emailField = cell.textField;
        [self.emailField setReturnKeyType:UIReturnKeyNext];
       
    }else if(indexPath.row == 1){
        cell.textField.placeholder = @"Password";
        cell.textField.secureTextEntry = YES;
        self.passwordField = cell.textField;
        [self.passwordField setReturnKeyType:UIReturnKeyNext];
    }else{
        cell.textField.placeholder = @"Password Confirm";
        cell.textField.secureTextEntry = YES;
        self.confirmField = cell.textField;
        [self.confirmField setReturnKeyType:UIReturnKeyJoin];
    }
    
    return cell;
}



#pragma mark UITableViewDelegate

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    SDFooterButtonView *footerView = [[SDFooterButtonView alloc] initWithStyle:SDFooterButtonStyleGreen];
    [footerView.button setTitle:@"Sign Up" forState:UIControlStateNormal];
    [footerView.button addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
    return footerView;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 75;
}

#pragma mark - SignUpViewControllerDelegate

- (void)signUp{

    NSLog(@"SIGN UP THE USER!");

}

@end
