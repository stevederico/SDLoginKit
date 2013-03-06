    //
    //  SDSignUpViewController.m
    //  SDLoginKit
    //
    //  Created by Steve Derico on 1/26/13.
    //  Copyright (c) 2013 Bixby Apps. All rights reserved.
    //

#import "SDSignUpViewController.h"

@interface SDSignUpViewController (){
    
    NSArray *_fields;
    
}
- (void)didTapSignUp;
@end

@implementation SDSignUpViewController
@synthesize delegate = _delegate;



- (id)init{
    
    return [self initWithArrayOfFields:@[@"Email", @"Password"]];
    
    
}

- (id)initWithArrayOfFields:(NSArray*)fields{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
        if ([fields count] == 0) {
            [NSArray arrayWithObjects:@"Email", @"Password", nil];
        }
        
        _fields = fields;
        self.title = @"Sign Up";

    }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [super viewDidUnload];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.tag == [self.tableView numberOfRowsInSection:0]-1) {
        [self didTapSignUp];
    }else if (textField.tag+1 == [self.tableView numberOfRowsInSection:0]-1){
        UITextField *tf = (UITextField*)[self.view viewWithTag:textField.tag+1];
        [tf setReturnKeyType:UIReturnKeyJoin];
        [tf becomeFirstResponder];
    }else {
        UITextField *tf = (UITextField*)[self.view viewWithTag:textField.tag+1];
        [tf becomeFirstResponder];
    }
    
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_fields count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifer = @"CellIdentifer";
    
    SDPlaceholderCell *cell = (SDPlaceholderCell*)[self.tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[SDPlaceholderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        cell.textField.delegate = self;
        [cell.textField setReturnKeyType:UIReturnKeyNext];
        [cell.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    }
    
    cell.textField.tag = indexPath.row;
    
    cell.textField.placeholder = [_fields objectAtIndex:indexPath.row];
    if ([cell.textField.placeholder isEqualToString:@"Password"]) {
        cell.textField.secureTextEntry = YES;
    }
    
    if (indexPath.row == [_fields count]) {
        [cell.textField setReturnKeyType:UIReturnKeyJoin];
    }
    
    return cell;
}



#pragma mark UITableViewDelegate

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    SDFooterButtonView *footerView = [[SDFooterButtonView alloc] initWithStyle:SDFooterButtonStyleGreen];
    [footerView.button setTitle:@"Sign Up" forState:UIControlStateNormal];
    [footerView.button addTarget:self action:@selector(didTapSignUp) forControlEvents:UIControlEventTouchUpInside];
    return footerView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 75;
}


#pragma mark - SDSignUpViewController

- (void)didTapSignUp{
    
    //get credinals
    NSMutableDictionary *creds = [[NSMutableDictionary alloc] init];
    
    //This should loop through all and use their placeholders as keys
    for (int i = 0; i < [self.tableView numberOfRowsInSection:0];i++) {
        SDPlaceholderCell *cell = (SDPlaceholderCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        NSString *k = cell.textField.placeholder;
        NSString *v = cell.textField.text;
        if (![k isEqualToString:@"Password"]) {
            k = k.lowercaseString;
        }
        [creds setValue:v forKey:k];
    }
    
    NSLog(@"CREDS %@",creds);
    
    if (!self.delegate) {
        [NSException exceptionWithName:@"OverrideSignUpWithCredentials" reason:@"No Delegate Set" userInfo:nil];
    }
    
    //call delegate
   [self.delegate signUpViewController:self signUpWithCredentials:creds];
    
}

- (void)signUpViewControllerDidSignUp{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)signUpViewControllerFailedToSignUpWithError:(NSError*)error {
    
    NSString *message = [[error localizedRecoverySuggestion] capitalizedString];
    
    NSLog(@"Failed! %@", message);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
    
}





@end
