//
//  Provocation.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProvocationType.h"

NS_ASSUME_NONNULL_BEGIN

@interface Provocation : NSObject

@property NSString *suggestion;
@property ProvocationType type;
@property NSString *provocation;

+ (instancetype)provocationFromSuggestion:(NSString*)suggestion;

- (instancetype)initWithSuggestion:(NSString*)suggestion;

@end

NS_ASSUME_NONNULL_END
