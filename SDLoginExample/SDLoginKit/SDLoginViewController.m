//
//  SDLoginViewController.m
//  SDLoginKit
//
//  Created by Steve Derico on 1/26/13.
//  Copyright (c) 2013 Bixby Apps. All rights reserved.
//

#import "SDLoginViewController.h"

@interface SDLoginViewController () 
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) SDSignUpViewController *signUpViewController;
@property (strong, nonatomic) UITextField *passwordField;
@property (strong, nonatomic) UITextField *emailField;
-(void)didTapSignIn;
@end

@implementation SDLoginViewController

@synthesize delegate = _delegate;
@synthesize passwordField = _passwordField;
@synthesize emailField = _emailField;
@synthesize signUpViewController = _signUpViewController;
@synthesize logoImageView = _logoImageView;

- (id)init{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.title = @"Login";
        self.passwordField.delegate = self;
        self.emailField.delegate = self;
        self.emailField.returnKeyType = UIReturnKeyNext;
        self.passwordField.returnKeyType = UIReturnKeyGo;
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 300, 100)];
        
        UIBarButtonItem *signUpButton = [[UIBarButtonItem alloc] initWithTitle:@"Sign Up" style:UIBarButtonItemStylePlain target:self action:@selector(didTapSignUp)];
        self.navigationItem.rightBarButtonItem = signUpButton;
        
        UIBarButtonItem *passwordButton = [[UIBarButtonItem alloc] initWithTitle:@"Forgot?" style:UIBarButtonItemStylePlain target:self action:@selector(didTapPasswordReset)];
        self.navigationItem.leftBarButtonItem = passwordButton;
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(didTapPasswordReset)];
        self.navigationItem.backBarButtonItem  = backButton;
        
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == _passwordField) {
        [self didTapSignIn];
    }else{
        [self.passwordField becomeFirstResponder];
    }
    return YES;
}

- (void)viewDidUnload {
    [self setPasswordField:nil];
    [self setEmailField:nil];
    [super viewDidUnload];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
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
        [self.emailField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [self.emailField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self.emailField setReturnKeyType:UIReturnKeyNext];
        [self.emailField becomeFirstResponder];
        
    }else{
        cell.textField.placeholder = @"Password";
        cell.textField.secureTextEntry = YES;
        self.passwordField = cell.textField;
        [self.passwordField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [self.passwordField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self.passwordField setReturnKeyType:UIReturnKeyGo];
    }
    
    return cell;
}

#pragma mark UITableViewDelegate

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    SDFooterButtonView *footerView = [[SDFooterButtonView alloc] initWithStyle:SDFooterButtonStyleGreen];
    [footerView.button setTitle:@"Sign In" forState:UIControlStateNormal];
    [footerView.button addTarget:self action:@selector(didTapSignIn) forControlEvents:UIControlEventTouchUpInside];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 75;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(10, 30, 300, 100)];
    [headerView addSubview:self.logoImageView];
    return headerView ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    [self.logoImageView setContentMode:UIViewContentModeScaleAspectFit];
    self.logoImageView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    if (self.logoImageView.image != nil) {
        return  110;
    } else {
        return 0;
    }
    
}

#pragma mark ViewController

- (void)didTapSignUp{
    self.signUpViewController = [[SDSignUpViewController alloc] initWithArrayOfFields:@[@"Email",@"Password", @"Company"]];
    [self.signUpViewController setDelegate:self.delegate];
    [self.navigationController pushViewController:self.signUpViewController animated:YES];
}

- (void)didTapSignIn{
    NSURLCredential *creds = [NSURLCredential credentialWithUser:self.emailField.text password:self.passwordField.text persistence:NSURLCredentialPersistenceNone];
    
    if (!self.delegate) {
        [NSException exceptionWithName:@"OverrideLogInWithCredentials" reason:@"No Delegate Set" userInfo:nil];
    }
    
    [self.delegate loginViewController:self authenticateWithCredential:creds];
    
}

- (void)didTapPasswordReset{
    SDPasswordResetViewController *pvc = [[SDPasswordResetViewController alloc] init];
    [self.navigationController pushViewController:pvc animated:YES];
}

#pragma mark SDLoginViewController

- (void)loginViewControllerDidAuthenticate{
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)loginViewControllerFailedToAuthenticateWithError:(NSError*)error{
    
    NSString *message = [[error localizedRecoverySuggestion] capitalizedString];
    
    NSLog(@"Failed! %@", message);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}

@end
