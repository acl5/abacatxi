//
//  ProvokePhase.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Provocation.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProvokePhase : NSObject

@property int currentTurn;

@property id timerTarget;
@property NSTimer* team1Timer;
@property NSInteger team1RemainingTime;
@property NSTimer* team2Timer;
@property NSInteger team2RemainingTime;

@property NSMutableArray* team1Provocations;
@property NSMutableArray* team2Provocations;

- (void)startPhaseWithTarget:(id) target;

- (void)addProvocation:(Provocation*)provocation;
- (void)passTurn;

@end

NS_ASSUME_NONNULL_END
