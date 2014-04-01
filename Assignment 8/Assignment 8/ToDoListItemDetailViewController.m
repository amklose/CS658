//
//  ToDoListItemDetailViewController.m
//  Assignment 8
//
//  Created by Anthony Klose on 3/27/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "ToDoListItemDetailViewController.h"
#import "ToDoListItem.h"

@interface ToDoListItemDetailViewController ()

@end

@implementation ToDoListItemDetailViewController

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
    [self setUpLines];
}

- (void)setUpLines
{
    UIView *underlineView, *overlineView;
    underlineView = [[UIView alloc] init];
    overlineView = [[UIView alloc] init];
    CGFloat x = self.textTextView.frame.origin.x;
    CGFloat y = self.textTextView.frame.origin.y;
    CGFloat width = self.textTextView.frame.size.width;
    CGFloat height = self.textTextView.frame.size.height;
    underlineView.frame = CGRectMake(x + height, y, width, 1);
    underlineView.backgroundColor = [UIColor lightGrayColor];
    overlineView.frame = CGRectMake(x, y, width, 1);
    overlineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:underlineView];
    [self.view addSubview:overlineView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView == self.textTextView && [textView.text isEqualToString:@"Notes"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = self.item.title;
    self.titleTextField.text = self.item.title;
    if (self.item.text != nil) {
        self.textTextView.text = self.item.text;
        self.textTextView.textColor = [UIColor blackColor];
    }
    if (self.item.isCompleted) {
        self.completedSwitch.on = YES;
    }
    if (self.item.dueDate != nil) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"MMMM d 'at' h:mm a" options:0 locale:[NSLocale currentLocale]]];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.item.title = [NSMutableString stringWithString:self.titleTextField.text];
    self.item.text = [NSMutableString stringWithString:self.textTextView.text];
    self.item.isCompleted = self.completedSwitch.isOn;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)screenTapped
{
    [self.view endEditing:YES];
}

- (IBAction)dateTapped
{
    UIActionSheet *pickerViewPopup = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles: nil];
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, self.dateLabel.frame.origin.y + self.dateLabel.frame.size.height, 320, 216)];
    datePicker.date = [NSDate date];
    datePicker.hidden = NO;
    [pickerViewPopup addSubview:datePicker];
    [pickerViewPopup showInView:self.view];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
