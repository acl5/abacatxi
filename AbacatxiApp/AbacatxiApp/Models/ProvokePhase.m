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
    
        self.team1RemainingTime = 1.5*60;
        self.team2RemainingTime = 1.5*60;
        
        return self;
    } else {
        return nil;
    }
}

- (void)startPhaseWithTarget:(id) target {
    self.timerTarget = target;
    
    if (self.currentTurn % 2 == 0) {
        // Team 1's turn
        self.team1Timer = [NSTimer scheduledTimerWithTimeInterval:1 target: target selector:@selector(team1TimerUpdate:) userInfo:NULL repeats:YES];
    } else {
        // Team 2's turn
        self.team2Timer = [NSTimer scheduledTimerWithTimeInterval:1 target: target selector:@selector(team2TimerUpdate:) userInfo:NULL repeats:YES];
    }
}

- (void)addProvocation:(Provocation*)provocation {
    if (self.currentTurn % 2 == 0) {
        // Team 1's turn
        [[self team1Provocations] addObject:provocation];
        [self.team1Timer invalidate];
        self.team2Timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self.timerTarget selector:@selector(team2TimerUpdate:) userInfo:NULL repeats:YES];
    } else {
        // Team 2's turn
        [[self team2Provocations] addObject:provocation];
        [self.team2Timer invalidate];
        self.team1Timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self.timerTarget selector:@selector(team1TimerUpdate:) userInfo:NULL repeats:YES];
    }
    
    self.currentTurn++;
}

- (void)passTurn {
    //[self addSuggestion:@""];
}

@end
