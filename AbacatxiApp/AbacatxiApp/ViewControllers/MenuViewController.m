//
//  MenuViewController.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#define appName @"MergeShift"

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menuLabel.text = appName;
    self.menuLabel.textColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0];
    [self.nextScreenButton setTitle:@"Play" forState:UIControlStateNormal];
    //self.nextScreenButton.backgroundColor = [UIColor colorWithRed:0.98 green:0.91 blue:0.83 alpha:1.0];
}

- (IBAction)changeScreen:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"menuToConnection" sender:self];
    });
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
