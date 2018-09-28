//
//  SelectionViewController.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "SelectionViewController.h"
#import "Game.h"

@interface SelectionViewController ()

@property (weak, nonatomic) IBOutlet UIButton *option1Button;
@property (weak, nonatomic) IBOutlet UIButton *option2Button;
@property (weak, nonatomic) IBOutlet UIButton *neitherButton;
@property (weak, nonatomic) IBOutlet UIButton *bothButton;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *team1CounterLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2CounterLabel;

@property (nonatomic) Game* game;

@end

@implementation SelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Get the game state
    self.game = [Game sharedManager];
<<<<<<< HEAD
    self.game.problem = @"Problem description";
    [self.game.suggestPhase addSuggestion: @"A1"];
    [self.game.suggestPhase addSuggestion: @"B1"];
    [self.game.suggestPhase addSuggestion: @"A2"];
    [self.game.suggestPhase addSuggestion: @"B2"];
    [self.game.suggestPhase addSuggestion: @"A3"];
    [self.game.suggestPhase addSuggestion: @"B3"];
    [self.game.suggestPhase addSuggestion: @"A4"];
    [self.game.suggestPhase addSuggestion: @"B4"];
    [self.game.suggestPhase addSuggestion: @"A5"];
    [self.game.suggestPhase addSuggestion: @"B5"];
    [self.game.suggestPhase addSuggestion: @"A6"];
    [self.game.suggestPhase addSuggestion: @"B6"];
=======
>>>>>>> provoke_phase
    
    // Set Problem description label
    self.descriptionLabel.text = self.game.problem;
    
    // Button Setups
    [self.option1Button addTarget:self
                           action:@selector(select:)
                 forControlEvents:UIControlEventPrimaryActionTriggered];
    [self.option2Button addTarget:self
                           action:@selector(select:)
                 forControlEvents:UIControlEventPrimaryActionTriggered];
    [self.bothButton addTarget:self
                           action:@selector(select:)
                 forControlEvents:UIControlEventPrimaryActionTriggered];
    [self.neitherButton addTarget:self
                           action:@selector(select:)
                 forControlEvents:UIControlEventPrimaryActionTriggered];
    
    // Load first options
    [self loadOptions];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) loadOptions {
    static int turn = 0;
    
    NSUInteger suggestionRounds = self.game.suggestPhase.team1Suggestions.count;
    NSUInteger provocationRounds = self.game.provokePhase.team1Provocations.count;
    
    if (turn < suggestionRounds) {
        // Get suggestions
        NSMutableArray* team1Suggestions = self.game.suggestPhase.team1Suggestions;
        NSMutableArray* team2Suggestions = self.game.suggestPhase.team2Suggestions;
        
        [self.option1Button setTitle:team1Suggestions[turn] forState:UIControlStateNormal];
        if (team2Suggestions.count < team1Suggestions.count) {
            [team2Suggestions addObject:@""];
        }
        [self.option2Button setTitle:team2Suggestions[turn] forState:UIControlStateNormal];
    } else if (turn < suggestionRounds + provocationRounds - 1) {
        // Get provocations
        NSMutableArray* team1Provocations = self.game.provokePhase.team1Provocations;
        NSMutableArray* team2Provocations = self.game.provokePhase.team2Provocations;
        
        Provocation* team1Provocation = (Provocation*) team1Provocations[turn - suggestionRounds];
        Provocation* team2Provocation = (Provocation*) team2Provocations[turn - suggestionRounds];
        [self.option1Button setTitle:team1Provocation.provocation forState:UIControlStateNormal];
        if (team2Provocations.count < team1Provocations.count) {
            [team2Provocations addObject: [[Provocation alloc] init]];
        }
        [self.option2Button setTitle:team2Provocation.provocation forState:UIControlStateNormal];
    }
    
    self.team1CounterLabel.text = [NSString stringWithFormat: @"%d", self.game.selectPhase.team1Score];
    self.team2CounterLabel.text = [NSString stringWithFormat: @"%d", self.game.selectPhase.team2Score];
    
    turn++;
    
    if (turn - suggestionRounds - 1 == provocationRounds) {
        // Perform segue into result screen
        [self performSegueWithIdentifier:@"selectionEndedSegue" sender:self];
    }
}

- (void)select:(UIButton*)sender {
    NSString* team1Suggestion = self.option1Button.titleLabel.text;
    NSString* team2Suggestion = self.option2Button.titleLabel.text;
    
    if ([sender isEqual: self.option1Button]) {
        // Selected Team 1's option
        [self.game.selectPhase addSelectedSuggestion:[[SelectedSuggestion alloc] initWithSuggestion: team1Suggestion
                                                                                            andTeam:1]];
    } else if ([sender isEqual: self.option2Button]) {
        // Selected Team 2's option
        [self.game.selectPhase addSelectedSuggestion:[[SelectedSuggestion alloc] initWithSuggestion: team2Suggestion
                                                                                            andTeam:2]];
    } else if ([sender isEqual: self.bothButton]) {
        // Selected both options
        [self.game.selectPhase addSelectedSuggestion:[[SelectedSuggestion alloc] initWithSuggestion: team1Suggestion
                                                                                            andTeam:1]];
        [self.game.selectPhase addSelectedSuggestion:[[SelectedSuggestion alloc] initWithSuggestion: team2Suggestion
                                                                                            andTeam:2]];
    } else if ([sender isEqual: self.neitherButton]) {
        // Didn't select either option
    }
    
    [self loadOptions];
}

@end
