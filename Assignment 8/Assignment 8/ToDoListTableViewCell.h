//
//  ToDoListTableViewCell.h
//  Assignment 8
//
//  Created by Anthony Klose on 3/25/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoListItem.h"

@interface ToDoListTableViewCell : UITableViewCell <UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UITextField* titleTextField;
@property(nonatomic, weak) ToDoListItem* item;

@end
