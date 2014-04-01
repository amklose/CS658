//
//  ToDoListItemDetailViewController.h
//  Assignment 8
//
//  Created by Anthony Klose on 3/27/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToDoListItem;

@interface ToDoListItemDetailViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate>

@property(nonatomic, weak) IBOutlet UITextField* titleTextField;
@property(nonatomic, weak) IBOutlet UITextView* textTextView;
@property(nonatomic, weak) IBOutlet UILabel* dateLabel;
@property(nonatomic, weak) IBOutlet UISwitch* completedSwitch;
@property(nonatomic, weak) ToDoListItem* item;
@property(nonatomic, weak) IBOutlet UIDatePicker* datePicker;

- (IBAction)screenTapped;
- (IBAction)dateTapped;

@end
