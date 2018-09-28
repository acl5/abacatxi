//
//  Provocation.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "Provocation.h"
#import <stdlib.h> // arc4random_uniform

@implementation Provocation

+ (instancetype)provocationFromSuggestion:(NSString*)suggestion {
    Provocation* provocation = [[self alloc] init];
    
    provocation.suggestion = suggestion;
    
    return provocation;
}

- (instancetype)init {
    if (self = [super init]) {
        self.type = (ProvocationType) (arc4random() % (int) ProvocationTypeMax); // Get a random provocation type
        return self;
    } else {
        return nil;
    }
}

- (instancetype)initWithSuggestion:(NSString*)suggestion {
    self = [self init];
    self.suggestion = suggestion;
    return self;
}

@end
