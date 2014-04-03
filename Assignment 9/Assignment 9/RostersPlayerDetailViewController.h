//
//  RostersPlayerDetailViewController.h
//  Assignment 9
//
//  Created by Anthony Klose on 4/1/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseballPlayer.h"

@interface RostersPlayerDetailViewController : UIViewController

@property(nonatomic, weak) IBOutlet UILabel* firstNameLabel;
@property(nonatomic, weak) IBOutlet UILabel* lastNameLabel;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) IBOutlet UIButton* moreInfoButton;
@property(nonatomic, weak) BaseballPlayer* player;

@end
