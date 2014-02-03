//
//  Card.h
//  Assignment 1
//
//  Created by Tony Klose on 1/24/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {Clubs, Diamonds, Hearts, Spades} Suit;

@interface Card : NSObject

@property(nonatomic) int value;
@property(nonatomic) Suit suit;

-(NSString*)nameForValue;
-(NSString*)nameForSuit;

@end

