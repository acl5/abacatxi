//
//  MenuViewController.h
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *menuLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextScreenButton;

- (IBAction)changeScreen:(id)sender;

@end

NS_ASSUME_NONNULL_END
