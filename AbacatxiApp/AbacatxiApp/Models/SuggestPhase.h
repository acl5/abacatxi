//
//  SuggestPhase.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuggestPhase : NSObject

@property NSInteger currentTurn;

@property id timerTarget;
@property NSTimer* team1Timer;
@property NSInteger team1RemainingTime;
@property NSTimer* team2Timer;
@property NSInteger team2RemainingTime;

@property NSInteger team1HeartRate;
@property NSInteger team2HeartRate;

@property NSMutableArray* team1Suggestions;
@property NSMutableArray* team2Suggestions;

- (void)startPhaseWithTarget:(id) target;

- (void)addSuggestion:(NSString*)suggestion;
- (void)passTurn;

@end

NS_ASSUME_NONNULL_END
