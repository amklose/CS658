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
@property(nonatomic, strong) UIView* underLineView;
@property(nonatomic, strong) UIView* overLineView;
@property(nonatomic, strong) UIView* verticalLineView;

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

- (void)setUpLines
{
    _underLineView = [[UIView alloc] init];
    _overLineView = [[UIView alloc] init];
    _verticalLineView = [[UIView alloc] init];
    _underLineView.frame = CGRectMake(_leftLabel.frame.origin.x, _leftLabel.frame.origin.y + _leftLabel.frame.size.height, _leftLabel.frame.size.width + _rightLabel.frame.size.width, 5);
        [self.view addSubview:_underLineView];
    _overLineView.frame = CGRectMake(_rightLabel.frame.origin.x, _rightLabel.frame.origin.y, _rightLabel.frame.size.width, 5);
    _verticalLineView.frame = CGRectMake(_rightLabel.frame.origin.x, _rightLabel.frame.origin.y, 5, _rightLabel.frame.size.height);
    [self.view addSubview:_underLineView];
    [self.view addSubview:_overLineView];
    [self.view addSubview:_verticalLineView];
}

- (void)displayMulProblem
{
    [_topLabel setText:[@(_operand1) stringValue]];
    [_rightLabel setText:[@(_operand2) stringValue]];
    [_leftLabel setText:@"x"];
    _overLineView.backgroundColor = [UIColor whiteColor];
    _verticalLineView.backgroundColor = [UIColor whiteColor];
    _underLineView.backgroundColor = [UIColor blackColor];
}

- (void)displayDivProblem
{
    [_rightLabel setText:[@(_operand1) stringValue]];
    [_leftLabel setText:[@(_operand2) stringValue]];
    _underLineView.backgroundColor = [UIColor whiteColor];
    _overLineView.backgroundColor = [UIColor blackColor];
    _verticalLineView.backgroundColor = [UIColor blackColor];
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
    [self setUpLines];
    [self generateNewProblem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
