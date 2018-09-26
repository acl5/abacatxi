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

@property (nonatomic) NSString* problem;

@property (nonatomic, strong) SuggestPhase* suggestPhase;
@property (nonatomic, strong) ProvokePhase* provokePhase;

+ (instancetype)sharedManager;

- (void)setProblem:(NSString*)problem;

@end

NS_ASSUME_NONNULL_END
