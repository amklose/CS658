//
//  BlankFiller.h
//  Assignment 2
//
//  Created by Tony Klose on 2/3/14.
//  Copyright (c) 2014 Tony Klose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface BlankFiller : NSObject

@property(nonatomic,strong) NSMutableArray* nouns;
@property(nonatomic,strong) NSMutableArray* verbs;
@property(nonatomic,strong) NSMutableArray* adjectives;
@property(nonatomic,strong) NSMutableArray* adverbs;
@property(nonatomic,strong) NSMutableArray* interjections;
@property(nonatomic,strong) NSMutableArray* templates;

-(id)init;
-(void)readWords;
-(void)addWord:(Word*)word;
-(Word*)getWordWithPartOfSpeech:(PartOfSpeech)partOfSpeech;

@end
