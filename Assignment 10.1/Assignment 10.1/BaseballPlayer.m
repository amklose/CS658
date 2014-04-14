//
//  BaseballPlayer.m
//  Assignment 9
//
//  Created by Anthony Klose on 4/1/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "BaseballPlayer.h"

@implementation BaseballPlayer

- (id)init
{
    return [self initWithFirstName:@"" lastName:@"" position:@""];
}

- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName position:(NSString*)position
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _position = position;
    }
    return self;
}

- (NSString*)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.position forKey:@"position"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.headshotUrl forKey:@"headshotUrl"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _firstName = [aDecoder decodeObjectForKey:@"firstName"];
        _lastName = [aDecoder decodeObjectForKey:@"lastName"];
        _position = [aDecoder decodeObjectForKey:@"position"];
        _url = [aDecoder decodeObjectForKey:@"url"];
        _headshotUrl = [aDecoder decodeObjectForKey:@"headshotUrl"];
    }
    return self;
}

@end
