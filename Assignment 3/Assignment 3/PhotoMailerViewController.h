//
//  ViewController.h
//  Assignment 3
//
//  Created by Tony Klose on 2/9/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoMailerViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel* label;
@property(nonatomic, weak) IBOutlet UIButton* button;

- (IBAction)buttonPressed:(id)sender;

@end
