//
//  RostersEditPlayerViewController.m
//  Assignment 9
//
//  Created by Anthony Klose on 4/1/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "RostersAddEditPlayerViewController.h"
#import "BaseballPlayer.h"
#define PORTRAIT_KEYBOARD_HEIGHT (216)

@interface RostersAddEditPlayerViewController ()

@end

@implementation RostersAddEditPlayerViewController

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
    // Do any additional setup after loading the view
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

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.center.y > (self.view.bounds.size.height - PORTRAIT_KEYBOARD_HEIGHT)) {
        [self moveView:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.center.y > (self.view.bounds.size.height - PORTRAIT_KEYBOARD_HEIGHT)) {
        [self moveView:NO];
    }
}

- (void)moveView:(BOOL)moveUp
{
    int distance = self.urlTextField.frame.size.height + 20;
    int movement = moveUp ? -distance : distance;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)cancel {
    [self.delegate cancelAddPlayer];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)done {
    self.player.firstName = self.firstNameTextField.text;
    self.player.lastName = self.lastNameTextField.text;
    self.player.url = self.urlTextField.text;
    [self.delegate doneAddPlayer];
    [self.navigationController popViewControllerAnimated:YES];
}

/*#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

}*/

@end
