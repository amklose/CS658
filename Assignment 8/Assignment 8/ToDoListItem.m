//
//  ToDoListItem.m
//  Assignment 8
//
//  Created by Anthony Klose on 3/25/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "ToDoListItem.h"

@implementation ToDoListItem

-(id) init
{
    self = [super init];
    if (self) {
        _title = [NSMutableString stringWithString:@"New To-Do Item"];
        _isCompleted = NO;
    }
    return self;
}


@end
