//
//  SuggestPhase.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "SuggestPhase.h"

@implementation SuggestPhase

- (id)init {
    if (self = [super init]) {
        self.currentTurn = 0;
        
        self.team1Suggestions = [[NSMutableArray alloc] init];
        self.team2Suggestions = [[NSMutableArray alloc] init];
        
        return self;
    } else {
        return nil;
    }
}

- (void)addSuggestion:(NSString *)suggestion {
    if (self.currentTurn % 2 == 0) {
        // Team 1's turn
        [[self team1Suggestions] addObject:suggestion];
    } else {
        // Team 2's turn
        [[self team2Suggestions] addObject:suggestion];
    }
    
    self.currentTurn++;
}

- (void)passTurn {
    [self addSuggestion:@""];
}

@end
