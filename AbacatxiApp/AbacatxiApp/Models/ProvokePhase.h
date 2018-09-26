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

@property NSMutableArray* team1Provocations;
@property NSMutableArray* team2Provocations;

- (void)addProvocation:(Provocation*)provocation;
- (void)passTurn;

@end

NS_ASSUME_NONNULL_END
