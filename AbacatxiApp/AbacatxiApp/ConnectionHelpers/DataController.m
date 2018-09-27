//
//  DataController.m
//  AbacatxiApp
//
//  Created by João Vicente on 27/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "DataController.h"

@interface DataController()

@property (class, strong, nonatomic) AppDelegate *appDelegate;

@end

@implementation DataController

+ (AppDelegate*)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

+ (void)setAppDelegate {}

+ (void)setupConnection:(BOOL)isTV {
    if (isTV) {
        [DataController.appDelegate.mpcHandler setupPeerWithDisplayName:@"AppleTV"];
    } else {
        [DataController.appDelegate.mpcHandler setupPeerWithDisplayName:[UIDevice currentDevice].name];
    }
    [DataController.appDelegate.mpcHandler setupSession];
    [DataController.appDelegate.mpcHandler advertiseSelf:isTV];
}

+ (NSInteger)countConnections {
    return DataController.appDelegate.mpcHandler.session.connectedPeers.count;
}

+ (BOOL)sendData:(NSString*) stringToSend {
    NSData *messageAsData = [stringToSend dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    [DataController.appDelegate.mpcHandler.session sendData:messageAsData toPeers:DataController.appDelegate.mpcHandler.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
    if (error != nil) {
        return YES;
    } else {
        return FALSE;
    }
}

@end
