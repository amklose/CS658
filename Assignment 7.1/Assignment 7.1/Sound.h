//
//  Sound.h
//  Assignment 7.1
//
//  Created by Tony Klose on 3/11/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Sound : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) AVAudioPlayer *audioPlayer;
@property(nonatomic, strong) UIImage *icon;

-(id)initWithName:(NSString *)name audioPlayer:(AVAudioPlayer *)audioPlayer icon:(UIImage *)icon;

@end
