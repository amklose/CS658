//
//  ViewController.h
//  Assignment 3.1
//
//  Created by Anthony Michael Klose on 2/11/14.
//  Copyright (c) 2014 Anthony Michael Klose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoMailerViewController : UIViewController

@property(nonatomic, weak) IBOutlet UITextView* textView;
@property(nonatomic, weak) IBOutlet UIButton* burnButton;
@property(nonatomic, weak) IBOutlet UIButton* madLibButton;

-(IBAction)buttonPressed:(id)sender;

@end
