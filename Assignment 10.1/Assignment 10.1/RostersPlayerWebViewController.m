//
//  RostersPlayerWebViewController.m
//  Assignment 9
//
//  Created by Anthony Klose on 4/2/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "RostersPlayerWebViewController.h"

@interface RostersPlayerWebViewController ()

@end

@implementation RostersPlayerWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.playerUrl]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
