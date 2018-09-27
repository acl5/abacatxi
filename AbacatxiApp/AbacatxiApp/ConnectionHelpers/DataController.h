//
//  DataController.h
//  AbacatxiApp
//
//  Created by João Vicente on 27/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "MPCHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataController : NSObject

+ (void) setupConnection:(BOOL) isTV;
+ (NSInteger) countConnections;
+ (BOOL) sendData:(NSString*) stringToSend;

@end

NS_ASSUME_NONNULL_END
