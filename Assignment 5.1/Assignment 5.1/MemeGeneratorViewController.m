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


@end

@implementation MemeGeneratorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIFont* font = [UIFont fontWithName:@"impact" size:18];
    self.upperText.font = font;
    self.upperText.textColor = [UIColor whiteColor];
    self.upperText.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.upperText.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.upperText.layer.shadowOpacity = 1.0f;
    self.upperText.layer.shadowRadius = 2.0f;
    self.lowerText.font = font;
    self.lowerText.textColor = [UIColor whiteColor];
    self.lowerText.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.lowerText.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.lowerText.layer.shadowOpacity = 1.0f;
    self.lowerText.layer.shadowRadius = 2.0f;
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
