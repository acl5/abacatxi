//
//  ConnectionViewController.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConnectionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *firstInstruction;
@property (weak, nonatomic) IBOutlet UILabel *thirdInstruction;
@property (weak, nonatomic) IBOutlet UILabel *fourthInstruction;
@property (weak, nonatomic) IBOutlet UIButton *nextScreenButton;
@property (weak, nonatomic) IBOutlet UIImageView *connectionStatusIndication;

- (IBAction)connectionToProblem:(id)sender;

@end

NS_ASSUME_NONNULL_END
