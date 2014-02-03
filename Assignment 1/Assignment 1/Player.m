//
//  Player.m
//  Assignment 1
//
//  Created by Tony Klose on 1/24/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id)init
{
    self = [super init];
    if (self) {
        _hand = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)addCard:(Card*)card
{
    [_hand addObject:card];
}

-(Card*)getNextCard
{
    Card* card = [_hand objectAtIndex:0];
    [_hand removeObjectAtIndex:0];
    
    return card;
}

-(BOOL)hadCards
{
    return [_hand count] > 0;
}

-(int)numCards
{
    return (int)[_hand count];
}

-(NSString*) description
{
    return _name;
}

@end

