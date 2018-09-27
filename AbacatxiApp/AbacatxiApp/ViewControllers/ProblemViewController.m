//
//  ProblemViewController.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "ProblemViewController.h"
#import "../Models/Game.h"

@interface ProblemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *problemTextField;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

@end

@implementation ProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Continue Button starts hidden until something is written in the problemTextField
    self.continueButton.hidden = true;
    [self.continueButton addTarget:self
                            action:@selector(startGame)
                  forControlEvents:UIControlEventPrimaryActionTriggered];
    
    // Setup the problemTextField
    self.problemTextField.delegate = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (![textField.text  isEqual: @""]) {
        self.continueButton.hidden = false;
    }
    return true;
}

- (void)startGame {
    Game *game = [Game sharedManager];
    [game clearGame]; // Clear the game, in case it's comming from replay
    game.problem = [[NSString alloc] initWithFormat: @"%@", self.problemTextField.text];
}

@end
