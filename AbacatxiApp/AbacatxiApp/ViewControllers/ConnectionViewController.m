//
//  ConnectionViewController.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "ConnectionViewController.h"
#import "AppDelegate.h"
#import "DataController.h"

@interface ConnectionViewController ()

@property (strong, nonatomic) AppDelegate *appDelegate;

@end

@implementation ConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.nextScreenButton setEnabled:FALSE];
    [DataController setupConnection:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(peerChangedStateWithNotification:) name:@"Abacatxi_DidChangeStateNotification" object:nil];
}

- (IBAction)connectionToProblem:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"connectionToProblem" sender:self];
    });
}

- (void)peerChangedStateWithNotification:(NSNotification *)notification {
    int state = [[[notification userInfo] objectForKey:@"state"] intValue];
    if (state != MCSessionStateConnecting) {
        if ([DataController countConnections] == 1) {
            [self.nextScreenButton setEnabled:YES];
            [self.nextScreenButton setSelected:YES];
            self.connectionStatusIndication.image = [UIImage imageNamed:@"icon_iphone_connected"];
        } else {
            [self.nextScreenButton setEnabled:FALSE];
            [self.nextScreenButton setSelected:FALSE];
            self.connectionStatusIndication.image = [UIImage imageNamed:@"icon_iphone_not_conected"];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
