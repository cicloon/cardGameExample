//
//  PlayingCard.m
//  CardGameExample
//
//  Created by cicloon on 07/12/13.
//  Copyright (c) 2013 cicloon. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit; // because we provide the getter and the setter


+ (NSArray *) validSuits{
    return @[@"♠️",@"♦️",@"♣️",@"♥️"];
}

+ (NSArray *) rankStrings{
    return @[@"?",@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank{ return [[self rankStrings] count]-1; }

- (int)match:(NSArray *)cards{
    int score = 0;
    NSUInteger matchedCards = 0;
    NSMutableArray *matchingCards = [[NSMutableArray alloc] initWithArray:cards];
    
    [matchingCards addObject:self];
    
    for (int i=0; i < [matchingCards count]; i++) {
        PlayingCard *matchingCard = [matchingCards objectAtIndex:i];
        for (int j= i+1; j < [matchingCards count]; j++) {
            BOOL matched = NO;
            PlayingCard *card = [matchingCards objectAtIndex:j];
            
            if (matchingCard.rank == card.rank) {
                score += 4;
                matched = YES;
            }
            
            if (matchingCard.suit == card.suit){
                score += 2;
                matched = YES;
            }
            
            if (matched) matchedCards++;
        }
    }
    
    return score * (matchedCards + 1);
}
    


- (NSString *)contents{
    NSString *rankString = [[PlayingCard rankStrings] objectAtIndex:self.rank];
    return [NSString stringWithFormat:@"%@%@", rankString, self.suit];
}


- (NSString *)suit{
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank{
    if(rank < [PlayingCard maxRank]) _rank = rank;
}


@end
