//
//  main.m
//  Assignment 2
//
//  Created by Tony Klose on 2/2/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BurnGenerator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BurnGenerator* bg = [[BurnGenerator alloc] init];
        MadLibGenerator* mlg = [[MadLibGenerator alloc] init];
        
        NSLog(@"%@\n", [bg generate]);
        
    }
    return 0;
}

