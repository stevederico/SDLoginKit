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

+ (void)presentModalLoginViewControllerOnViewController:(UIViewController*)viewController withDelegate:(id)delegate{
    
    SDLoginViewController *loginViewController = [[SDLoginViewController alloc] init];
    [loginViewController setDelegate:delegate];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [viewController presentViewController:nvc animated:YES completion:nil];
    
}

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
        self.logoImage = [UIImage imageNamed:@"KKLogo.jpg"];
        self.logoImageView.image = self.logoImage;
        
        UIBarButtonItem *signUpButton = [[UIBarButtonItem alloc] initWithTitle:@"Sign Up" style:UIBarButtonItemStylePlain target:self action:@selector(didTapSignUp)];
        self.navigationItem.rightBarButtonItem = signUpButton;
        
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
        [self.emailField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self.emailField setReturnKeyType:UIReturnKeyNext];
        [self.emailField becomeFirstResponder];
        
    }else{
        cell.textField.placeholder = @"Password";
        cell.textField.secureTextEntry = YES;
        self.passwordField = cell.textField;
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

#pragma mark - SDLoginViewControllerDelegate

- (id)loginViewControllerShouldBeginLogin:(NSDictionary*)credentials{
    
        //Send Login Request to Your Server
        //Process Response
        //Return NSError for Failure
        //Returen Anything else including nil for Success
    
        //EXAMPLE FAILURE
    NSDictionary *dictionaryUserInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"Alert Title", @"Title", @"Don't Forget to override ShouldBeginLogin. Return an NSError to display alerts.", @"Message", nil];
    return [NSError errorWithDomain:@"SDLoginExample" code:410 userInfo:dictionaryUserInfo];
        //EXAMPLE SUCCESS
        // User *myUser = [User authenicatedUserFromBackend]
        // return myUser
    
        //You can also return nil for Success
        // return nil
    
}


- (void)loginViewControllerDidSuccessfullyLoginWithResponse:(id)response {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)loginViewControllerFailedToLoginWithError:(NSError*)error{
    
    NSString *title = [[error.userInfo objectForKey:@"Title"] capitalizedString];
    NSString *message = [[error.userInfo objectForKey:@"Message"] capitalizedString];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}


#pragma mark ViewController


- (void)didTapSignUp{
    
    _signUpViewController = [[SDSignUpViewController alloc] initWithArrayOfFields:@[@"Email",@"Password", @"Company"]];
    [_signUpViewController setDelegate:self.delegate];
    [self.navigationController pushViewController:_signUpViewController animated:YES];
}

- (void)didTapSignIn{
    
        //insert regex validate call here
    
        //get credinals
    NSDictionary *creds = [NSDictionary dictionaryWithObjectsAndKeys:self.emailField.text.lowercaseString, @"Email",self.passwordField.text, @"Password", nil];
    
        //call delegate
    id response = [self.delegate loginViewControllerShouldBeginLogin:creds];
    
    if ([response isKindOfClass:[NSError class]]) {
            //There was an error
        [self.delegate loginViewControllerFailedToLoginWithError:response];
    } else {
        [self.delegate loginViewControllerDidSuccessfullyLoginWithResponse:response];
        
    }
    
    
    
    
    
}

@end
