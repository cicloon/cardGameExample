//
//  CardMatchingGame.h
//  CardGameExample
//
//  Created by cicloon on 22/12/13.
//  Copyright (c) 2013 cicloon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSInteger lastScore;
@property (nonatomic) NSUInteger toMatchCards;
@property (nonatomic, strong, readonly) NSMutableArray *chosenCards; // of Card
@property (nonatomic, readonly) BOOL startedGame;


// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
                 withToMatchCards:(NSUInteger) withToMatchCards;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

- (BOOL)alreadyTriedMatching;

- (NSInteger) defaultToMatchCards;

@end
