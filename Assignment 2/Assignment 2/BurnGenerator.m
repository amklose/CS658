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
        NSLog(@"%@\n", [self generate]);
    }
    
    return self;
}

-(void)readBurnTemplates
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"burnTemplateList" ofType:@"txt"];
    NSError* error;
    NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedFailureReason]);
        return;
    }
    
    NSArray* fileLines = [fileContents componentsSeparatedByString:@"\n"];
    WordTemplate* template = [WordTemplate alloc];
    
    for (NSString* fileLine in fileLines) {
        template = [template initWithTemplate:fileLine];
        [[super templates] addObject:template];
    }
}

@end
