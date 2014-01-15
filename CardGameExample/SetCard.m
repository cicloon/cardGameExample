//
//  SetCard.m
//  CardGameExample
//
//  Created by cicloon on 11/01/14.
//  Copyright (c) 2014 cicloon. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

static const int MAX_RANK = 15;

static const int COLOR_MATCH_SCORE = 2;
static const int FIGURE_MATCH_SCORE = 5;
static const int RANK_MATCH_SCORE = 9;


- (instancetype)initWithRank:(NSUInteger)rank withFigure:(NSUInteger)figure withColor:(NSUInteger)color{
    self = [super init];
    
    if (self){
        // TODO: validate rank figure and color
        self.rank = rank;
        self.figure = figure;
        self.color = color;
    }
    
    return self;
}


- (int)match:(NSArray *)cards{

    NSInteger colorScore = 0;
    NSInteger figureScore = 0;
    NSInteger rankScore = 0;
    
    
    BOOL colorMatching = YES;
    BOOL figureMatching = YES;
    BOOL rankMatching = YES;
    
    for (int i = 0; i < [cards count] && (colorMatching || figureMatching || rankMatching ) ; i++) {
        SetCard *matchingCard = [cards objectAtIndex:i];
        
        if (colorMatching){
            if (matchingCard.color == self.color) { colorScore += COLOR_MATCH_SCORE; }
            else{ colorScore = 0; colorMatching = NO; }
        }

        if (figureMatching){
            if (matchingCard.figure == self.figure) { figureScore += FIGURE_MATCH_SCORE; }
            else{ figureScore = 0; figureMatching = NO; }
        }
        
        if (rankMatching){
            if (matchingCard.rank == self.rank) { rankScore += RANK_MATCH_SCORE; }
            else{ rankScore = 0; rankMatching = NO; }
        }
    }
    return MAX (MAX(colorScore, figureScore), rankScore);
}


- (NSString *)contents{
    return @"";
}


+ (NSUInteger)maxRank{
    return MAX_RANK;
}

+ (NSArray *)validColors{
    return @[@"red", @"green", @"blue", @"orange"];
}

+ (NSArray *)validFigures{
    return @[@"⚾︎", @"⚑", @"☁︎"];
}


@end
