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
        self.delegate = self;
        self.emailField.returnKeyType = UIReturnKeyNext;
        self.passwordField.returnKeyType = UIReturnKeyGo;
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 300, 100)];
        self.logoImage = [UIImage imageNamed:@"superman"];
        self.logoImageView.image = self.logoImage;
        
        UIBarButtonItem *signUpButton = [[UIBarButtonItem alloc] initWithTitle:@"Sign Up" style:UIBarButtonItemStylePlain target:self action:@selector(didTapSignUp)];
        self.navigationItem.rightBarButtonItem = signUpButton;
    
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    if (textField == _passwordField) {
        [self.delegate didTapSignIn];
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
        [self.emailField setReturnKeyType:UIReturnKeyNext];
        [self.emailField becomeFirstResponder];
        
    }else{
        cell.textField.placeholder = @"Password";
        cell.textField.secureTextEntry = YES;
        self.passwordField = cell.textField;
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


#pragma mark - LoginViewControllerDelegate

- (void)didTapSignIn{
    
    NSLog(@"SignIn!");

}

- (void)didTapSignUp{

    NSLog(@"Show SignUp!");
        
    _signUpViewController = [[SDSignUpViewController alloc] init];

    [self.navigationController pushViewController:_signUpViewController animated:YES];
    
    
}


@end
