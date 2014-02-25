//
//  ViewController.h
//  Assignment 5.1
//
//  Created by Anthony Michael Klose on 2/25/14.
//  Copyright (c) 2014 Anthony Michael Klose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemeGeneratorViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(nonatomic, weak) IBOutlet UIImageView* imageView;
@property(nonatomic, weak) IBOutlet UITextView* upperText;
@property(nonatomic, weak) IBOutlet UITextView* lowerText;

@end
