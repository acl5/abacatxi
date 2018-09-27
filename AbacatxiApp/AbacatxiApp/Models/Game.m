//
//  Game.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "Game.h"

@implementation Game

// Singleton initialization
+ (instancetype)sharedManager {
    static Game* sharedGame = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGame = [[self alloc] init];
    });
    return sharedGame;
}

- (instancetype)init {
    if (self = [super init]) {
        self.problem = @"";
        
        self.suggestPhase = [[SuggestPhase alloc] init];
        self.provokePhase = [[ProvokePhase alloc] init];
        self.selectPhase = [[SelectPhase alloc] init];
        
        return self;
    } else {
        return nil;
    }
}

@end
