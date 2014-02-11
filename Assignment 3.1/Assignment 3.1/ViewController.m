//
//  ViewController.m
//  Assignment 3.1
//
//  Created by Anthony Michael Klose on 2/11/14.
//  Copyright (c) 2014 Anthony Michael Klose. All rights reserved.
//

#import "ViewController.h"
#import "BurnGenerator.h"
#import "MadLibGenerator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender
{
    BlankFiller *generator = [[BlankFiller alloc] init];
    if (sender == _madLibButton) {
        generator = [[MadLibGenerator alloc] init];
    } else if (sender == _burnButton) {
        generator = [[BurnGenerator alloc]init];
    }
    [_textView setText:[generator generate]];
}

@end
