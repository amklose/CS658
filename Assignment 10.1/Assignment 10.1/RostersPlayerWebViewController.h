//
//  RostersPlayerWebViewController.h
//  Assignment 9
//
//  Created by Anthony Klose on 4/2/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RostersPlayerWebViewController : UIViewController

@property(nonatomic, weak) IBOutlet UIWebView* webView;
@property(nonatomic, weak) NSString* playerUrl;

@end
