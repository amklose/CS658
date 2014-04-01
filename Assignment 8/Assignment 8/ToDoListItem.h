//
//  ToDoListItem.h
//  Assignment 8
//
//  Created by Anthony Klose on 3/25/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoListItem : NSObject

@property(nonatomic, strong) NSMutableString* title;
@property(nonatomic, strong) NSMutableString* text;
@property(nonatomic, strong) NSDate* dueDate;
@property(nonatomic) BOOL isCompleted;

-(id) init;

@end
