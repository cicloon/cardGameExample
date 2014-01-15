//
//  MatchismoViewController.m
//  CardGameExample
//
//  Created by cicloon on 06/12/13.
//  Copyright (c) 2013 cicloon. All rights reserved.
//

#import "MatchismoViewController.h"
#import "PlayingCardDeck.h"

#import "CardMatchingGame.h"

@interface MatchismoViewController ()


@property (strong, nonatomic)Deck *deck;

@property (strong, nonatomic)CardMatchingGame *game;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *matchesSelector;

@property (strong, nonatomic) NSMutableArray *movementHistory;

@property (strong, nonatomic) IBOutlet UILabel *historyLabel;

@property (strong, nonatomic) IBOutlet UISlider *historySlider;

@end

@implementation MatchismoViewController

- (Deck *)deck{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (CardMatchingGame *)game{
    if (!_game) { _game = [self createGame]; }
    return _game;
}

- (NSMutableArray *)movementHistory{
    if (!_movementHistory) { _movementHistory = [[NSMutableArray alloc] init]; }
    return _movementHistory;
}


- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (CardMatchingGame *)createGame{
    return [[CardMatchingGame alloc] initWithCardCount: [self.cardButtons count]
                                             usingDeck: [self createDeck] ];
}

- (IBAction)flip:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateHistory];
    [self updateUI];
}

- (IBAction)redeal:(id)sender {
    self.game = [self createGame];
    self.movementHistory = nil;
    [self updateUI];
}

- (IBAction)changeMatchesNeeded:(UISegmentedControl *)sender {
    self.game.toMatchCards = sender.selectedSegmentIndex + 2;
}

- (IBAction)historySliderMoved:(UISlider *)sender {
    [self updateHistoryLabelForIndex: [sender value]];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int buttonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:buttonIndex];

        [self setCardButtonTitle: [self titleForCard:card] ForCardButton:cardButton];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        [self updateScore:self.game.score];
    }
    
    if (self.matchesSelector) {
        self.matchesSelector.enabled = !self.game.startedGame;
    }
    
    
    [self updateHistoryLabelForIndex: [self.movementHistory count] - 1  ];
    if (self.historySlider) {
        self.historySlider.maximumValue = [self.movementHistory count];
        self.historySlider.value = [self.movementHistory count];
    }
    
    
}

- (void)updateHistoryLabelForIndex:(NSInteger)index{
    if (index < [self.movementHistory count]) {
        [self.historyLabel setAttributedText: [self.movementHistory objectAtIndex:index] ];
    }

    if (index == [self.movementHistory count] - 1) {
        self.historyLabel.alpha = 1;
    } else {
        self.historyLabel.alpha = 0.6;
    }
    
}


- (void)updateHistory{
    NSArray *chosenCards = self.game.chosenCards;
    NSString *resultString = nil;
    NSMutableAttributedString *historyAttributedString = [[NSMutableAttributedString alloc] init];
    
    if ([self.game alreadyTriedMatching]) {
        
        NSAttributedString *chosenCardsContent = [self contentFromCards:chosenCards];
        
        [historyAttributedString appendAttributedString:chosenCardsContent];
        
        if (self.game.lastScore > 0) {
            
            resultString = [NSString stringWithFormat:@" matched for %d points", self.game.lastScore ];

        } else {
            
            resultString = [NSString stringWithFormat:@" didn't match for %d points", self.game.lastScore ];
            
        }
        
        [historyAttributedString appendAttributedString: [[NSAttributedString alloc] initWithString: resultString]];
        
        
    } else {
        Card *lastCard = [chosenCards lastObject];
        if (lastCard) {
            
            [historyAttributedString appendAttributedString: [self titleForCard:lastCard] ];
            [historyAttributedString appendAttributedString: [[NSAttributedString alloc] initWithString: @" flipped"]] ;


            
        } else {
            [historyAttributedString appendAttributedString: [[NSAttributedString alloc] initWithString: @"Last card unflipped"]];
        }
    }

    [self.movementHistory addObject: historyAttributedString ];
    
}




- (NSAttributedString *)contentFromCards:(NSArray *)cards{

    NSMutableAttributedString *contents = [[NSMutableAttributedString alloc] init];
    for (Card *card in cards) {
        [contents appendAttributedString: [self titleForCard:card ]  ];
    }
    return contents;
}

- (NSAttributedString *)titleForCard:(Card *)card{
    return  [[NSAttributedString alloc] initWithString: card.isChosen ? card.contents : @"" ];
}

- (void) setCardButtonTitle:(NSAttributedString *) title ForCardButton:(UIButton*)cardButton{
        [cardButton setAttributedTitle:title forState:UIControlStateNormal];
}


- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback" ];
}

- (void)updateScore:(int)score {
    
    [self.scoreLabel setText: [NSString stringWithFormat:@"Score: %d", score]];
}


@end
