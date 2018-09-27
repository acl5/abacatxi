//
//  ResultViewController.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "ResultViewController.h"
#import "Game.h"
#import "SuggestionCollectionViewCell.h"

@interface ResultViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *winnerIV;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *selectedSugestionsCV;

@property (nonatomic) Game* game;

@end

@implementation ResultViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.selectedSugestionsCV registerNib:[UINib nibWithNibName:@"SuggestionCollectionViewCell" bundle:[NSBundle mainBundle]]
        forCellWithReuseIdentifier:@"suggestionCell"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Get game data
    self.game = [Game sharedManager];
    
    // CollectionView Setup
    self.selectedSugestionsCV.dataSource = self;
    
    // Load the winner
    [self loadWinner];
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
            self.winnerIV.image = [UIImage imageNamed:@"icon_team 1"];
            break;
            
        case 2: // Team 2 won
            self.winnerLabel.text = @"Team 2 won!";
            self.winnerIV.image = [UIImage imageNamed:@"icon_team 2"];
            break;
            
        default: // Tie
            self.winnerLabel.text = @"It was a tie!";
            break;
    }
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"This is being executed!");
    
    SuggestionCollectionViewCell* cell = (SuggestionCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"suggestionCell" forIndexPath:indexPath];
    
    SelectedSuggestion* selectedSuggestion = self.game.selectPhase.selectedSuggestions[indexPath.row];
    
    cell.suggestionLabel.text = selectedSuggestion.suggestion;
    
    if (selectedSuggestion.team == 1) {
        // Suggestion made by team 1
        cell.teamBoxImageView.image = [UIImage imageNamed:@"textbox_team 1"];
    } else {
        // Suggestion made by team 2
        cell.teamBoxImageView.image = [UIImage imageNamed:@"textbox_team 2"];
    }
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.game.selectPhase.selectedSuggestions.count;
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    // No idea what should go here
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    // No idea what should go here
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    // No idea what should go here
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(600, 300);
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    // No idea what should go here
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    // No idea what should go here
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    // No idea what should go here
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    // No idea what should go here
}

- (void)setNeedsFocusUpdate {
    // No idea what should go here
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)updateFocusIfNeeded {
    // No idea what should go here
}

@end
