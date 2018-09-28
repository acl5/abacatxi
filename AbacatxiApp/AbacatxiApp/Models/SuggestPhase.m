//
//  SuggestPhase.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "SuggestPhase.h"

#define TEAM_TIME 30

@implementation SuggestPhase

- (id)init {
    if (self = [super init]) {
        self.currentTurn = 0;
        
        self.team1Suggestions = [[NSMutableArray alloc] init];
        self.team2Suggestions = [[NSMutableArray alloc] init];
        
        self.team1RemainingTime = TEAM_TIME;
        self.team2RemainingTime = TEAM_TIME;
        
        self.team1HeartRate = 100;
        self.team2HeartRate = 100;
        
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

- (void)addSuggestion:(NSString *)suggestion {
    if (self.currentTurn % 2 == 0) {
        // Team 1's turn
        [self.team1Suggestions addObject:suggestion];
        [self.team1Timer invalidate];
        self.team2Timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self.timerTarget selector:@selector(team2TimerUpdate:) userInfo:NULL repeats:YES];
    } else {
        // Team 2's turn
        [self.team2Suggestions addObject:suggestion];
        [self.team2Timer invalidate];
        self.team1Timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self.timerTarget selector:@selector(team1TimerUpdate:) userInfo:NULL repeats:YES];
    }
    
    self.currentTurn++;
}

- (void)passTurn {
    [self addSuggestion:@""];
}

@end
