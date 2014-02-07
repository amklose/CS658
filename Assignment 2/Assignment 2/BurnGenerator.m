//
//  BurnGenerator.m
//  Assignment 2
//
//  Created by Anthony Michael Klose on 2/4/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "BurnGenerator.h"
#import "WordTemplate.h"

@implementation BurnGenerator

// Designated initializer
-(id)init
{
    self = [super init];
    if (self) {
        [self readBurnTemplates];
    }
    
    return self;
}

-(void)readBurnTemplates
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"burnTemplateList" ofType:@"txt"];
    NSError* error;
    NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"%@\n\n", [error localizedFailureReason]);
        
        return;
    }
    
    NSArray* fileLines = [fileContents componentsSeparatedByString:@"\n"];
    
    for (NSString* fileLine in fileLines) {
        WordTemplate* template = [[WordTemplate alloc] initWithTemplate:fileLine];
        [[super templates]addObject:template];
    }
}

@end
