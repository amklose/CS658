//
//  FirstViewController.m
//  Assignment 6
//
//  Created by Tony Klose on 3/4/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "FlashCardsViewController.h"

@interface FlashCardsViewController ()

- (IBAction)viewTapped:(id)sender;
@property(nonatomic) BOOL solutionDisplayed;

@property(nonatomic, strong) NSString* solution;

@end

@implementation FlashCardsViewController

- (void)displayNewProblem
{
    [_solutionLabel setText:@""];
    _solutionDisplayed = false;
    
    int operand1 = arc4random_uniform(99);
    int operand2 = arc4random_uniform(99);
    int operation = arc4random_uniform(2);
    NSString* operator = operation == 0 ? @"+" : @"-";
    _solution = [NSString stringWithFormat:@"%i", (operation == 0) ? (operand1 + operand2) : (operand1 - operand2)];
    
    [_op1Label setText:[@(operand1) stringValue]];
    [_op2Label setText:[@(operand2) stringValue]];
    [_operatorLabel setText:operator];
}

- (void)displaySolution
{
    [_solutionLabel setText:_solution];
    _solutionDisplayed = true;
}

- (IBAction)viewTapped:(id)sender
{
    if (!_solutionDisplayed) {
        [self displaySolution];
    } else {
        [self displayNewProblem];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView* underlineView = [[UIView alloc] init];
    CGFloat xCoordinate = _operatorLabel.frame.origin.x;
    CGFloat yCoordinate = _operatorLabel.frame.origin.y + _operatorLabel.frame.size.height;
    CGFloat width = _operatorLabel.frame.size.width + _op2Label.frame.size.width;
    underlineView.frame = CGRectMake(xCoordinate, yCoordinate, width, 5);
    underlineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:underlineView];
    [self displayNewProblem];
    _solutionDisplayed = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
