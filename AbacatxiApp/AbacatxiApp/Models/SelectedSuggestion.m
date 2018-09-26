//
//  SelectedSuggestion.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "SelectedSuggestion.h"

@implementation SelectedSuggestion

- (instancetype)init {
    if (self = [super init]) {
        self.suggestion = @"";
        self.team = 0;
        
        return self;
    } else {
        return nil;
    }
}

- (instancetype)initWithSuggestion:(NSString*)suggestion andTeam:(int)team {
    if ([self init]) {
        self.suggestion = suggestion;
        self.team = team;
        
        return self;
    } else {
        return nil;
    }
}

@end
