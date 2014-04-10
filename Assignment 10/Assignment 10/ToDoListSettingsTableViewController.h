//
//  ToDoListSettingsTableViewController.h
//  Assignment 10
//
//  Created by Anthony Klose on 4/7/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListSettingsTableViewController : UITableViewController

@property(nonatomic, weak) IBOutlet UISwitch *deleteOnCompleteSwitch;
@property(nonatomic, weak) NSMutableString *deleteOnComplete;

@end
