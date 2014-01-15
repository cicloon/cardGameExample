//
//  Deck.m
//  CardGameExample
//
//  Created by cicloon on 07/12/13.
//  Copyright (c) 2013 cicloon. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;


@end


@implementation Deck


- (NSMutableArray *) cards{
    if (!_cards)  _cards = [[NSMutableArray alloc] init];
    return _cards;
}



- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards addObject:card];
    } else{
        [self.cards insertObject:card atIndex:0];
    }
}


- (void)addCard:(Card *)card{
    [self addCard:card atTop:YES];
}


- (Card *)drawRandomCard{
    Card *card = nil;
    if  ([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        card = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return card;
}


@end
