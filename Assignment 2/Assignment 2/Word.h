//
//  Word.h
//  Assignment 2
//
//  Created by Tony Klose on 2/3/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{NOUN, VERB, ADJECTIVE, ADVERB, INTERJECTION, UNKNOWN} PartOfSpeech;

@interface Word : NSObject

@property(nonatomic, strong) NSString *word;
@property(nonatomic) PartOfSpeech partOfSpeech;

+(PartOfSpeech)convertStringToPartOfSpeech:(NSString*)string;

-(id)init;
-(id)initWithWord:(NSString*)word
     partOfSpeech:(PartOfSpeech)partOfSpeech;
-(id)initWithWord:(NSString*)word;
-(NSString*)description;

@end
