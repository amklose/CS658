//
//  ViewController.m
//  Assignment 5
//
//  Created by Tony Klose on 2/24/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "PhotoMailerViewController.h"

@interface PhotoMailerViewController ()

- (IBAction)imageTapped:(id)sender;
- (IBAction)imageLongPressed:(id)sender;

@end

@implementation PhotoMailerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Respond to gestures
- (IBAction)imageTapped:(id)sender
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

- (IBAction)imageLongPressed:(id)sender
{
    MFMailComposeViewController* mailComposer = [[MFMailComposeViewController alloc]init];
    mailComposer.delegate = self;
    
    NSData* data = UIImagePNGRepresentation(self.imageView.image);
    [mailComposer addAttachmentData:data mimeType:@"image/png" fileName:@"PhotoMailerImage"];
    [self presentViewController:mailComposer animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _imageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
