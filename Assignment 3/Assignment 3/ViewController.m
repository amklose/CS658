//
//  ViewController.m
//  Assignment 3
//
//  Created by Tony Klose on 2/9/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSMutableArray* questions;
@property(nonatomic, strong) NSMutableArray* answers;
@property(nonatomic) BOOL isQuestionDisplayed;
@property(nonatomic) int currentQuestion;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _questions = [[NSMutableArray alloc] init];
    _answers = [[NSMutableArray alloc] init];
    _isQuestionDisplayed = TRUE;
    _currentQuestion = arc4random_uniform((int)[_questions count]);
    
    [self populateQuestionsAndAnswers];
    [_label setText:[_questions objectAtIndex:_currentQuestion]];
}

- (void)populateQuestionsAndAnswers
{
    [_questions addObject:@"What is the capital of Alaska?"];
    [_answers addObject:@"Juneau"];
    
    [_questions addObject:@"What is the capital of Connecticut?"];
    [_answers addObject:@"Hartford"];
    
    [_questions addObject:@"What is the capital of Kentucky?"];
    [_answers addObject:@"Frankfort"];
    
    [_questions addObject:@"What is the capital of Pennsylvania?"];
    [_answers addObject:@"Harrisburg"];
    
    [_questions addObject:@"What is the capital of Vermont?"];
    [_answers addObject:@"Montpelier"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender
{
    if (_isQuestionDisplayed) {
        [_label setText:[_answers objectAtIndex:_currentQuestion]];
        [_button setTitle:@"New Question" forState:UIControlStateNormal];
        _currentQuestion = arc4random_uniform((int)[_questions count]);
        _isQuestionDisplayed = FALSE;
    } else {
        [_label setText:[_questions objectAtIndex:_currentQuestion]];
        [_button setTitle:@"Show Answer" forState:UIControlStateNormal];
        _isQuestionDisplayed = TRUE;
    }
}

@end
