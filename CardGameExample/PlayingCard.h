//
//  PlayingCard.h
//  CardGameExample
//
//  Created by cicloon on 07/12/13.
//  Copyright (c) 2013 cicloon. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSArray *) rankStrings;
+ (NSUInteger) maxRank;

@end