//
//  SelectPhase.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SelectedSuggestion.h"

NS_ASSUME_NONNULL_BEGIN

@interface SelectPhase : NSObject

@property int team1Score;
@property int team2Score;

@property NSMutableArray* selectedSuggestions;

- (void)addSelectedSuggestion:(SelectedSuggestion*)selectedSuggestion;

@end

NS_ASSUME_NONNULL_END
