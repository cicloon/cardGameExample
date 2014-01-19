//
//  HistoryViewController.m
//  CardGameExample
//
//  Created by cicloon on 18/01/14.
//  Copyright (c) 2014 cicloon. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (NSMutableArray *)movementHistory{
    if(!_movementHistory){ _movementHistory = [[NSMutableArray alloc] init]; }
    return _movementHistory;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{
    NSMutableAttributedString *actualText = [[NSMutableAttributedString alloc] initWithString:@"\n"];
    for (NSAttributedString *movement in self.movementHistory) {

        [actualText appendAttributedString:movement];
        [actualText appendAttributedString: [[NSAttributedString alloc] initWithString:@"\n"]];
        self.movementsTextView.attributedText = actualText;
        
    }
}


@end
