//
//  ProvokePhase.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "ProvokePhase.h"

@implementation ProvokePhase

- (id)init {
    if (self = [super init]) {
        self.currentTurn = 0;
        
        self.team1Provocations = [[NSMutableArray alloc] init];
        self.team2Provocations = [[NSMutableArray alloc] init];
        
        return self;
    } else {
        return nil;
    }
}

- (void)addProvocation:(Provocation*)provocation {
    if (self.currentTurn % 2 == 0) {
        // Team 1's turn
        [[self team1Provocations] addObject:provocation];
    } else {
        // Team 2's turn
        [[self team2Provocations] addObject:provocation];
    }
    
    self.currentTurn++;
}

- (void)passTurn {
    //[self addSuggestion:@""];
}

@end
