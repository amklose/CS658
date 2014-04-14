//
//  RostersPositionTableViewController.h
//  Assignment 9
//
//  Created by Anthony Klose on 4/1/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RostersPositionTableViewController : UITableViewController

@property(nonatomic, strong) NSArray* allPositions;

- (BOOL)saveChanges;

@end
