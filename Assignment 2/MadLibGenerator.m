//
//  MadLibGenerator.m
//  Assignment 2
//
//  Created by Tony Klose on 2/5/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "MadLibGenerator.h"
#import "WordTemplate.h"

@implementation MadLibGenerator

// Designated initializer
-(id)init
{
    self = [super init];
    if (self) {
        [self readMadLibTemplates];
    }
    
    return self;
}

-(void)readMadLibTemplates
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"madLibTemplateList" ofType:@"txt"];
    NSError* error;
    NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedFailureReason]);
        return;
    }
    
    NSArray* fileLines = [fileContents componentsSeparatedByString:@"\n\n"];
    WordTemplate* template = [WordTemplate alloc];
    
    for (NSString* fileLine in fileLines) {
        template = [template initWithTemplate:fileLine];
        [[super templates]addObject:template];
    }
}

@end
