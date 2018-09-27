//
//  SelectedSuggestion.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectedSuggestion : NSObject

@property NSString* suggestion;
@property int team;

- (instancetype)initWithSuggestion:(NSString*)suggestion andTeam:(int)team;

@end

NS_ASSUME_NONNULL_END
