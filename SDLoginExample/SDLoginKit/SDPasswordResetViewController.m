//
//  SDPasswordResetViewController.m
//  SDLoginKit
//
//  Created by Steve Derico on 2/28/13.
//  Copyright (c) 2013 OpCon. All rights reserved.
//

#import "SDPasswordResetViewController.h"

@interface SDPasswordResetViewController ()

@end

@implementation SDPasswordResetViewController

- (id) init{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    self.title = @"Forgot Password?";
    
    return self;

}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    return cell;
}


#pragma mark - Table view delegate

#pragma mark UITableViewDelegate

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    SDFooterButtonView *footerView = [[SDFooterButtonView alloc] initWithStyle:SDFooterButtonStyleGreen];
    [footerView.button setTitle:@"Send Reset Email" forState:UIControlStateNormal];
    [footerView.button addTarget:self action:@selector(didTapSendReset) forControlEvents:UIControlEventTouchUpInside];
    return footerView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 75;
}

- (void)didTapSendReset{
    
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  
    
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    


}


@end
