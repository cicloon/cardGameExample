//
//  HistoryViewController.h
//  CardGameExample
//
//  Created by cicloon on 18/01/14.
//  Copyright (c) 2014 cicloon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *movementHistory;
@property (strong, nonatomic) IBOutlet UITextView *movementsTextView;

@end
