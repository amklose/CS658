//
//  FirstViewController.h
//  Assignment 6
//
//  Created by Tony Klose on 3/4/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MulDivFlashCardsViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel* topLabel;
@property(nonatomic, weak) IBOutlet UILabel* rightLabel;
@property(nonatomic, weak) IBOutlet UILabel* leftLabel;
@property(nonatomic, weak) IBOutlet UILabel* bottomLabel;

- (void)generateNewProblem;
- (void)displayMulProblem;
- (void)displayDivProblem;
- (void)displaySolution;

@end
