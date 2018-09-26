//
//  SuggestPhase.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuggestPhase : NSObject

@property int currentTurn;

@property NSMutableArray* team1Suggestions;
@property NSMutableArray* team2Suggestions;

- (void)addSuggestion:(NSString*)suggestion;
- (void)passTurn;

@end

NS_ASSUME_NONNULL_END
