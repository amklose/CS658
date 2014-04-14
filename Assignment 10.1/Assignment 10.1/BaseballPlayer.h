//
//  BaseballPlayer.h
//  Assignment 9
//
//  Created by Anthony Klose on 4/1/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>
#define DEFAULT_HEADSHOT_URL @"http://sports.cbsimg.net/images/players/unknown_hat.gif"

@interface BaseballPlayer : NSObject <NSCoding>

@property(nonatomic, strong) NSString* firstName;
@property(nonatomic, strong) NSString* lastName;
@property(nonatomic, strong) NSString* position;
@property(nonatomic, strong) NSString* url;
@property(nonatomic, strong) NSString* headshotUrl;

- (id)init;
- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName position:(NSString*)position;
- (NSString*)fullName;

@end
