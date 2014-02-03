//
//  Deck.h
//  CS658
//
//  Created by Tony Klose on 1/24/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Deck : NSObject

@property(nonatomic, strong, readonly) NSMutableArray* cards;

-(Card*)dealCard;
-(BOOL)hasCards;

@end

