//
//  ResultViewController.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "ResultViewController.h"
#import "Game.h"

@interface ResultViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *winnerIV;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *selectedSugestionsCV;

@property (nonatomic) Game* game;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Get game data
    self.game = [Game sharedManager];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) loadWinner {
    int winner = 0;
    if (self.game.selectPhase.team1Score > self.game.selectPhase.team2Score) {
        winner = 1;
    } else if (self.game.selectPhase.team1Score < self.game.selectPhase.team2Score) {
        winner = 2;
    }
    
    switch (winner) {
        case 1: // Team 1 won
            self.winnerLabel.text = @"Team 1 won!";
            break;
            
        case 2: // Team 2 won
            self.winnerLabel.text = @"Team 2 won!";
            break;
            
        default: // Tie
            self.winnerLabel.text = @"It was a tie!";
            break;
    }
}

@end
