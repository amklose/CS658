//
//  SecondViewController.h
//  Assignment 6
//
//  Created by Tony Klose on 3/4/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSubQuizViewController : UIViewController

@property(nonatomic, strong)IBOutletCollection(UILabel) NSArray* questionLabels;
@property(nonatomic, strong)IBOutletCollection(UITextField) NSArray* answerTextFields;
@property(nonatomic, strong)IBOutletCollection(UIImageView) NSArray* correctnessImages;
@property(nonatomic, weak)IBOutlet UIButton* button;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)screenTapped:(id)sender;
- (void)generateQuiz;

@end
