//
//  Game.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SuggestPhase.h"
#import "ProvokePhase.h"

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject

@property NSString* problem;

@property (nonatomic, assign) SuggestPhase* suggestPhase;
@property (nonatomic, assign) ProvokePhase* provokePhase;

@end

NS_ASSUME_NONNULL_END
