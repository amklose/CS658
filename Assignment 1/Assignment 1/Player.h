//
//  Player.h
//  CS658
//
//  Created by Tony Klose on 1/24/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Player : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong, readonly) NSMutableArray* hand;

-(void)addCard:(Card*)card;
-(Card*)getNextCard;
-(BOOL)hadCards;
-(int)numCards;

@end

