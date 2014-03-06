//
//  FirstViewController.m
//  Assignment 6
//
//  Created by Tony Klose on 3/4/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "MulDivFlashCardsViewController.h"

@interface MulDivFlashCardsViewController ()

- (IBAction)viewTapped:(id)sender;

@property(nonatomic) int operation;
@property(nonatomic) int operand1;
@property(nonatomic) int operand2;
@property(nonatomic) BOOL solutionDisplayed;
@property(nonatomic, strong) NSString* solution;

@end

@implementation MulDivFlashCardsViewController

- (void)generateNewProblem
{
    [_topLabel setText:@""];
    [_bottomLabel setText:@""];
    
    _solutionDisplayed = false;
    _operation = arc4random_uniform(2);
    
    if (_operation == 0) {
        _operand1 = arc4random_uniform(9);
        _operand2 = arc4random_uniform(9);
    } else {
        _operand1 = arc4random_uniform(99);
        do {
            _operand2 = arc4random_uniform(9);
        } while (_operand2 == 0 || _operand1 % _operand2 != 0);
    }
    _solution = [NSString stringWithFormat:@"%i", (_operation == 0) ? (_operand1 * _operand2) : (_operand1 / _operand2)];
    (_operation == 0) ? [self displayMulProblem] : [self displayDivProblem];
}

- (void)displayMulProblem
{
    [_topLabel setText:[@(_operand1) stringValue]];
    [_rightLabel setText:[@(_operand2) stringValue]];
    [_leftLabel setText:@"x"];
    
    UIView* underlineView = [[UIView alloc] init];
    CGFloat xCoordinate = _leftLabel.frame.origin.x;
    CGFloat yCoordinate = _leftLabel.frame.origin.y + _leftLabel.frame.size.height;
    CGFloat width = _leftLabel.frame.size.width + _rightLabel.frame.size.width;
    underlineView.frame = CGRectMake(xCoordinate, yCoordinate, width, 5);
    underlineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:underlineView];
}

- (void)displayDivProblem
{
    [_rightLabel setText:[@(_operand1) stringValue]];
    [_leftLabel setText:[@(_operand2) stringValue]];
    
    // Make lines for division problem
    
}

- (void)displaySolution
{
    if (_operation == 0) {
        [_bottomLabel setText:_solution];
    } else {
        [_topLabel setText:_solution];
    }
    _solutionDisplayed = true;
}

- (IBAction)viewTapped:(id)sender
{
    if (!_solutionDisplayed) {
        [self displaySolution];
    } else {
        [self generateNewProblem];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self generateNewProblem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
