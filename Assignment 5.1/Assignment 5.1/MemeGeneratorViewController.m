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
- (IBAction)UpdateVerticalPosition:(id)sender;

@end

@implementation MemeGeneratorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIFont* font = [UIFont fontWithName:@"impact" size:18];
    self.upperText.font = self.lowerText.font = font;
    self.upperText.textColor = self.lowerText.textColor = [UIColor whiteColor];
    self.upperText.layer.shadowColor = self.lowerText.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.upperText.layer.shadowOffset = self.lowerText.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.upperText.layer.shadowOpacity = self.lowerText.layer.shadowOpacity = 1.0f;
    self.upperText.layer.shadowRadius = self.lowerText.layer.shadowRadius = 2.0f;
}

- (void) viewDidAppear:(BOOL)animated
{
    
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

- (IBAction)UpdateVerticalPosition:(id)sender
{
    UIPanGestureRecognizer* recognizer = (UIPanGestureRecognizer*)sender;
    UIView* view = recognizer.view;
    CGPoint translation = [recognizer translationInView:view];
    view.center = CGPointMake(view.center.x, view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:view];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
