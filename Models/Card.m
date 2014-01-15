//
//  Card.m
//  CardGameExample
//
//  Created by cicloon on 06/12/13.
//  Copyright (c) 2013 cicloon. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)cards{
    int score = 0;
    for (Card *card in cards) {
        if ([card.contents isEqualToString:self.contents]) {
            score += 1;
        }
    }
    
    return score;
}



@end
