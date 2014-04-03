//
//  RostersEditPlayerViewController.h
//  Assignment 9
//
//  Created by Anthony Klose on 4/1/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseballPlayer;

@protocol RostersAddPlayerDelegate <NSObject>

- (void)doneAddPlayer;
- (void)cancelAddPlayer;

@end

@interface RostersAddEditPlayerViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic, weak) IBOutlet UITextField* firstNameTextField;
@property(nonatomic, weak) IBOutlet UITextField* lastNameTextField;
@property(nonatomic, weak) IBOutlet UILabel* positionLabel;
@property(nonatomic, weak) IBOutlet UITextField* urlTextField;
@property(nonatomic, weak) BaseballPlayer* player;
@property(nonatomic) BOOL isAddingPlayer;
@property(nonatomic, weak) id <RostersAddPlayerDelegate> delegate;

- (IBAction)cancel;
- (IBAction)done;

@end
