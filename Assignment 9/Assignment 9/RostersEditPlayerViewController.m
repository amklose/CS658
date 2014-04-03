//
//  RostersEditPlayerViewController.m
//  Assignment 9
//
//  Created by Anthony Klose on 4/1/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "RostersEditPlayerViewController.h"
#import "BaseballPlayer.h"

@interface RostersEditPlayerViewController ()

@end

@implementation RostersEditPlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.firstNameTextField.text = self.player.firstName;
    self.lastNameTextField.text = self.player.lastName;
    self.positionLabel.text = self.player.position;
    self.urlTextField.text = self.player.url;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)cancel {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)done {
    self.player.firstName = self.firstNameTextField.text;
    self.player.lastName = self.lastNameTextField.text;
    self.player.url = self.urlTextField.text;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"editPlayerSegue"]) {
        RostersEditPlayerViewController* dest = [segue destinationViewController];
        dest.player = self.player;
    }
}

@end
