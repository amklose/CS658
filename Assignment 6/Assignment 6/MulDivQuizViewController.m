//
//  SecondViewController.m
//  Assignment 6
//
//  Created by Tony Klose on 3/4/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "MulDivQuizViewController.h"
#define PORTRAIT_KEYBOARD_HEIGHT (216)

@interface MulDivQuizViewController ()
@property(nonatomic, strong) NSMutableArray* answers;
@property(nonatomic, strong) UIImage* correctImage;
@property(nonatomic, strong) UIImage* incorrectImage;

@end

@implementation MulDivQuizViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _answers = [[NSMutableArray alloc] init];
    NSString* correctImagePath = [[NSBundle mainBundle]pathForResource:@"correct" ofType:@"jpg"];
    NSString* incorrectImagePath = [[NSBundle mainBundle]pathForResource:@"incorrect" ofType:@"jpg"];
    _correctImage = [[UIImage alloc] initWithContentsOfFile:correctImagePath];
    _incorrectImage = [[UIImage alloc] initWithContentsOfFile:incorrectImagePath];
    [self generateQuiz];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)generateQuiz
{
    int operand1, operand2;
    for (UILabel* questionLabel in _questionLabels) {
        int operation = arc4random_uniform(2);
        if (operation == 0) {
            operand1 = arc4random_uniform(9);
            operand2 = arc4random_uniform(9);
        } else {
            operand1 = arc4random_uniform(99);
            do {
                operand2 = arc4random_uniform(9);
            } while (operand2 == 0 || operand1 % operand2 != 0);
        }
        NSString* operator = operation == 0 ? @"x" : @"÷";
        [questionLabel setText:[NSString stringWithFormat:@"%i %@ %i%@=", operand1, operator, operand2, (operand1 < 10 && operand2 < 10) ? @"\t\t" : @"\t"]];
        [_answers addObject:[NSString stringWithFormat:@"%i", (operation == 0) ? (operand1 * operand2) : (operand1 / operand2)]];
    }
}

- (IBAction)buttonPressed:(id)sender
{
    if ([_button.currentTitle isEqualToString:@"New Quiz"]) {
        [_answers removeAllObjects];
        for (UIImageView* correctnessImageView in _correctnessImages) {
            [correctnessImageView setImage:nil];
        }
        for (UITextField* answerTextField in _answerTextFields) {
            [answerTextField setText:@""];
        }
        [self generateQuiz];
        [_button setTitle:@"Submit Answers" forState:UIControlStateNormal];
    } else {
        for (int i = 0; i < _answers.count; i += 1) {
            if ([_answers[i] isEqualToString:[_answerTextFields[i] text]]) {
                [_correctnessImages[i] setImage:_correctImage];
            } else {
                [_correctnessImages[i] setImage:_incorrectImage];
            }
        }
        [_button setTitle:@"New Quiz" forState:UIControlStateNormal];
    }
}

- (IBAction)screenTapped:(id)sender
{
    [self.view endEditing:true];
}

- (void)textFieldDidBeginEditing:(UITextField*) textField
{
    if (textField.center.y > (self.view.bounds.size.height - PORTRAIT_KEYBOARD_HEIGHT)) {
        [self moveView:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField*) textField
{
    if (textField.center.y > (self.view.bounds.size.height - PORTRAIT_KEYBOARD_HEIGHT)) {
        [self moveView:NO];
    }
    
}

- (void)moveView:(BOOL)moveUp
{
    int movement = moveUp ? -PORTRAIT_KEYBOARD_HEIGHT : PORTRAIT_KEYBOARD_HEIGHT;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
