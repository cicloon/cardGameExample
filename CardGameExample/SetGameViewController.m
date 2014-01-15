//
//  SetGameViewController.m
//  CardGameExample
//
//  Created by cicloon on 12/01/14.
//  Copyright (c) 2014 cicloon. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetMatchingGame.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController


- (Deck *)createDeck{
    return [[SetCardDeck alloc] init];
}

- (SetMatchingGame *)createGame{
    return [[SetMatchingGame alloc] initWithCardCount: [self.cardButtons count]
                                             usingDeck: [self createDeck] ];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self createDeck];
    [self createGame];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    @try{
        [super updateUI];
    }
    @catch (NSException *theException){
        NSLog(@"Exception: %@", theException);
    }
    
    
}



- (NSAttributedString *)titleForCard:(Card *)card{
    
    SetCard *setCard = (SetCard *)card;
    
    NSDictionary *colors = @{@"red": [UIColor redColor],
                             @"green": [UIColor greenColor],
                             @"blue": [UIColor blueColor],
                             @"orange": [UIColor orangeColor]};
    
    NSString *figureString = [[SetCard validFigures] objectAtIndex:setCard.figure];
    
    NSString *titleString = [[NSString alloc] initWithFormat:@"%d %@", setCard.rank, figureString ];
    
    NSString *colorString = [[SetCard validColors] objectAtIndex:setCard.color];
    
    NSDictionary *attributes =  @{NSForegroundColorAttributeName: [colors objectForKey: colorString]};
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:titleString attributes: attributes ];
    
    return title;
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    UIImage *background;
    if ( card.isMatched ){
        background = nil;
    } else {
        background = [UIImage imageNamed:card.isChosen ? @"cardfront" : @"setcardchosen" ];
    }
    
    return background;
}





@end
