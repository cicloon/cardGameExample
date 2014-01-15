//
//  CardMatchingGame.m
//  CardGameExample
//
//  Created by cicloon on 22/12/13.
//  Copyright (c) 2013 cicloon. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray * cards; // of Card
@property (nonatomic, strong, readwrite) NSMutableArray *chosenCards; // of Card
@property (nonatomic, readwrite) BOOL startedGame;
@property (nonatomic, readwrite) NSInteger lastScore;

@end

@implementation CardMatchingGame


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
static const int TO_MATCH_CARDS_DEFAULT = 2;

- (NSMutableArray *)cards{
    if (!_cards)  _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (NSMutableArray *)chosenCards{
    if (!_chosenCards) _chosenCards = [[NSMutableArray alloc] init];
    return _chosenCards;
}


- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    
    self = [super init]; //super's designated initializer
    self.toMatchCards = [self defaultToMatchCards];
    if (self){
        for (NSUInteger i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card){
                [self.cards addObject: card ];
            } else {
                self = nil;
                break;
            }

        }
        self.startedGame = NO;
        self.lastScore = 0;
    }
    
    return self;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
                 withToMatchCards:(NSUInteger)withToMatchCards
{
    
    self = [self initWithCardCount:count usingDeck:deck];
    
    if (self){
        self.toMatchCards = withToMatchCards;
    }
    return self;
}




- (Card *)cardAtIndex:(NSUInteger)index
{
    Card *card = nil;
    if ( index < [self.cards count]  ){
        card = [self.cards objectAtIndex:index];
    }
    return card;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    self.startedGame = YES;
    Card *card = [self cardAtIndex:index];
    int matchScore = 0;
    NSInteger previousScore = self.score;
    if ([self alreadyTriedMatching]) [self resetChosenCards];
    
    if (!card.isMatched){
        
        if (card.isChosen){
            [self unchooseCard:card];
        } else {
            card.chosen = YES;
            
            if ( [self enoughCardsToMatch] ) {
                matchScore = [card match:self.chosenCards];
                [self.chosenCards addObject:card];
                if (matchScore > 0) {
                    self.score += matchScore;
                    [self setChosenCardsAsMatched];
                } else {
                    self.score -= MISMATCH_PENALTY;
                }
            } else{
                [self.chosenCards addObject:card];
            }
            
            self.score -= COST_TO_CHOOSE;
            self.lastScore = self.score - previousScore;
        }
        
    }

}


- (BOOL)alreadyTriedMatching
{
    return ([self.chosenCards count] == self.toMatchCards);
}

- (void)resetChosenCards
{
    for (Card *card in self.chosenCards) {
        card.chosen = card.isMatched;
    }
    [self.chosenCards removeAllObjects];
}


- (BOOL)enoughCardsToMatch
{
    return ([self.chosenCards count] == self.toMatchCards - 1);
}


- (void)unchooseCard:(Card *)card
{
    card.chosen = NO;
    [self.chosenCards removeObject:card];
}


- (void)setChosenCardsAsMatched
{
    for (Card *card in self.chosenCards) {
        card.matched = YES;
        card.chosen = YES;
    }
    
}

- (NSInteger) defaultToMatchCards{
    return TO_MATCH_CARDS_DEFAULT;
}

@end
