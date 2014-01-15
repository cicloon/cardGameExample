//
//  SetCardDeck.m
//  CardGameExample
//
//  Created by cicloon on 12/01/14.
//  Copyright (c) 2014 cicloon. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck


- (instancetype)init{
    self = [super init];
    int figureCount = [[SetCard validFigures] count];
    int colorsCount = [[SetCard validColors] count];
    if (self) {
        for (int figure = 0; figure < figureCount; figure++ ) {
            for (int color = 0; color < colorsCount; color++) {
                for (int rank = 1; rank < [SetCard maxRank]; rank++) {
                    SetCard *card = [[SetCard alloc] initWithRank:rank
                                                       withFigure:figure
                                                        withColor:color];
                    
                    [self addCard:card];
                }
            }
        }
    }
    
    return self;
}


@end
