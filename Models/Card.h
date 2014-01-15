//
//  Card.h
//  CardGameExample
//
//  Created by cicloon on 06/12/13.
//  Copyright (c) 2013 cicloon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;


- (int)match:(NSArray *)cards;



@end
