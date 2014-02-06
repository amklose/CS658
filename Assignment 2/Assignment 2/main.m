//
//  main.m
//  Assignment 2
//
//  Created by Tony Klose on 2/2/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BurnGenerator.h"
#import "MadLibGenerator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BurnGenerator* bg = [[BurnGenerator alloc] init];
        MadLibGenerator* mlg = [[MadLibGenerator alloc] init];
        
        for (int i=0; i<3; ++i) {
            NSLog(@"%@\n\n", [bg generate]);
        }

        for (int i=0; i<3; ++i) {
            NSLog(@"%@\n\n", [mlg generate]);
        }
    }
    return 0;
}

