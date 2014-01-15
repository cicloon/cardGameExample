//
//  Deck.h
//  CardGameExample
//
//  Created by cicloon on 07/12/13.
//  Copyright (c) 2013 cicloon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;


@end
