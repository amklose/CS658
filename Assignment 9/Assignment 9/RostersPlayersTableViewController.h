//
//  RostersPlayersTableViewController.h
//  Assignment 9
//
//  Created by Anthony Klose on 4/1/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RostersAddEditPlayerViewController.h"

@interface RostersPlayersTableViewController : UITableViewController <RostersAddPlayerDelegate>

@property(nonatomic, weak) NSMutableArray* players;
@property(nonatomic, strong) BaseballPlayer* dummyPlayer;

- (void)addPlayer;

@end
