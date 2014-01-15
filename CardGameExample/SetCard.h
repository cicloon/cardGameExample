//
//  SetCard.h
//  CardGameExample
//
//  Created by cicloon on 11/01/14.
//  Copyright (c) 2014 cicloon. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger figure;
@property (nonatomic) NSUInteger rank;
@property (nonatomic) NSUInteger color;


+ (NSUInteger) maxRank;
+ (NSArray *) validFigures;
+ (NSArray *) validColors;

- (instancetype) initWithRank:(NSUInteger)rank  withFigure:(NSUInteger)figure withColor:(NSUInteger)color;


@end
