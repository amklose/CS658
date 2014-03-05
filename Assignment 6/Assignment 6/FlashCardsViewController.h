//
//  FirstViewController.h
//  Assignment 6
//
//  Created by Tony Klose on 3/4/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlashCardsViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel* op1Label;
@property(nonatomic, weak) IBOutlet UILabel* op2Label;
@property(nonatomic, weak) IBOutlet UILabel* operatorLabel;
@property(nonatomic, weak) IBOutlet UILabel* solutionLabel;

- (void)displayNewProblem;
- (void)displaySolution;

@end
