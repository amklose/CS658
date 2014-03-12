//
//  Sound.m
//  Assignment 7.1
//
//  Created by Tony Klose on 3/11/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import "Sound.h"

@implementation Sound

-(id)init
{
    return [self initWithName:@"" audioPlayer:[[AVAudioPlayer alloc]init] icon:[[UIImage alloc] init]];
}

-(id)initWithName:(NSString *)name audioPlayer:(AVAudioPlayer *)audioPlayer icon:(UIImage *)icon
{
    self = [super init];
    if (self) {
        _name = name;
        _audioPlayer = audioPlayer;
        _icon = icon;
    }
    return self;
}

@end
