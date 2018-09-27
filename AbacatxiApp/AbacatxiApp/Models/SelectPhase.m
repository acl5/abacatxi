//
//  SelectPhase.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "SelectPhase.h"

@implementation SelectPhase

- (id)init {
    if (self = [super init]) {
        self.team1Score = 0;
        self.team2Score = 0;
        
        self.selectedSuggestions = [[NSMutableArray alloc] init];
        
        return self;
    } else {
        return nil;
    }
}

- (void)addSelectedSuggestion:(SelectedSuggestion*)selectedSuggestion {
    [self.selectedSuggestions addObject: selectedSuggestion];
    
    if (selectedSuggestion.team == 1) {
        // Suggestion made by team 1
        self.team1Score++;
    } else {
        // Suggestion made by team 2
        self.team2Score++;
    }
}

@end
