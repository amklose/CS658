//
//  ViewController.m
//  Assignment 5.1
//
//  Created by Anthony Michael Klose on 2/25/14.
//  Copyright (c) 2014 Anthony Michael Klose. All rights reserved.
//

#import "MemeGeneratorViewController.h"

@interface MemeGeneratorViewController ()

- (IBAction)ImageTapped:(id)sender;

@property(nonatomic) int keyboardSize;
@property(nonatomic) bool currentlyEditingText;
@property(nonatomic, weak) UITextView* activeTextView;

@end

@implementation MemeGeneratorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIFont* font = [UIFont fontWithName:@"impact" size:18];
    _upperText.font = _lowerText.font = font;
    _upperText.textColor = _lowerText.textColor = [UIColor whiteColor];
    _upperText.layer.shadowColor = _lowerText.layer.shadowColor = [[UIColor blackColor] CGColor];
    _upperText.layer.shadowOffset = _lowerText.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    _upperText.layer.shadowOpacity = _lowerText.layer.shadowOpacity = 1.0f;
    _upperText.layer.shadowRadius = _lowerText.layer.shadowRadius = 2.0f;
    
    _upperText.delegate = self;
    _lowerText.delegate = self;
    _scrollView.delegate = self;
    
    _currentlyEditingText = false;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ImageTapped:(id)sender
{
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* userInfo = [aNotification userInfo];
    CGRect keyboardInfoFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    int width = keyboardInfoFrame.size.width;
    int height = keyboardInfoFrame.size.height;
    _keyboardSize = (width < height) ? width : height;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ((orientation == UIInterfaceOrientationPortrait) || (orientation == UIInterfaceOrientationLandscapeLeft) || (orientation == UIInterfaceOrientationLandscapeRight))
        return YES;
    return NO;
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _scrollView.contentInset = contentInsets;
    _scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    CGPoint scrollPoint = CGPointMake(0, _keyboardSize);
    [_scrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textViewDidEndEditing:(UITextView *)textview
{
    _activeTextView = nil;
}

@end
