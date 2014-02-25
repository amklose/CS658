//
//  ViewController.h
//  Assignment 5
//
//  Created by Tony Klose on 2/24/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface PhotoMailerViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate>

@property(nonatomic, weak) IBOutlet UIImageView* imageView;

@end
