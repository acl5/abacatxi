//
//  SuggestPhaseViewController.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "SuggestPhaseViewController.h"
#import "SuggestionCollectionViewCell.h"
#import "Game.h"

@interface SuggestPhaseViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *team1TimerLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2TimerLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *sugestionsCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *heartMonitor;
@property (weak, nonatomic) IBOutlet UILabel *team1CounterLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2CounterLabel;
@property (weak, nonatomic) IBOutlet UIView *endOfPhaseView;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

@property Game* game;

@property NSTimer* heartTimer;

@end

@implementation SuggestPhaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.sugestionsCollectionView registerNib:[UINib nibWithNibName:@"SuggestionCollectionViewCell" bundle:[NSBundle mainBundle]]
                forCellWithReuseIdentifier:@"suggestionCell"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Get game
    self.game = [Game sharedManager];
    
    // View Setup
    self.descriptionLabel.text = self.game.problem;
    self.team1TimerLabel.text = @"03:00"; self.team2TimerLabel.text = @"03:00";
    self.sugestionsCollectionView.dataSource = self;
    self.team1CounterLabel.textColor = [UIColor colorWithRed:((float)(0xF9 / 255.0))
                                                       green:((float)(0xE5 / 255.0))
                                                        blue:((float)(0x65 / 255.0))
                                                       alpha:1.0];
    self.team2CounterLabel.textColor = [UIColor colorWithRed:((float)(0x69 / 255.0))
                                                       green:((float)(0xA3 / 255.0))
                                                        blue:((float)(0xBC / 255.0))
                                                       alpha:1.0];
    
    // Start Phase
    [self.game.suggestPhase startPhaseWithTarget:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)team1TimerUpdate: (NSTimer*)sender {
    [self.heartTimer invalidate];
    NSInteger remainingTime = --self.game.suggestPhase.team1RemainingTime;
    NSInteger minutes = remainingTime / 60;
    NSInteger seconds = remainingTime - (60*minutes);
    self.team1TimerLabel.text = [NSString stringWithFormat: @"%02lu:%02lu", minutes, seconds];
    
    if (remainingTime % 10 == 0) {
        [self getSuggestion:@"Can I have the... uuuuuuhhhmmmm..."];
    }
    
    if (remainingTime == 0) {
        [sender invalidate];
        self.endOfPhaseView.hidden = false;
        [self.continueButton setNeedsFocusUpdate];
    }
    
    // Update heartRate
    
    self.heartTimer = [NSTimer scheduledTimerWithTimeInterval:60.0/self.game.suggestPhase.team1HeartRate
                                                           target:self
                                                         selector:@selector(heartBeat)
                                                         userInfo:NULL
                                                      repeats:YES];
}

- (void)team2TimerUpdate: (NSTimer*)sender {
    [self.heartTimer invalidate];
    NSInteger remainingTime = --self.game.suggestPhase.team2RemainingTime;
    NSInteger minutes = remainingTime / 60;
    NSInteger seconds = remainingTime - (60*minutes);
    self.team2TimerLabel.text = [NSString stringWithFormat: @"%02lu:%02lu", minutes, seconds];
    
    if (remainingTime % 10 == 0) {
        [self getSuggestion:@"Can I have the... uuuuuuhhhmmmm..."];
    }
    
    if (remainingTime == 0) {
        [sender invalidate];
        self.endOfPhaseView.hidden = false;
        [self.continueButton setNeedsFocusUpdate];
    }
    
    // Update heartRate
    
    self.heartTimer = [NSTimer scheduledTimerWithTimeInterval:60.0/self.game.suggestPhase.team1HeartRate
                                                       target:self
                                                     selector:@selector(heartBeat)
                                                     userInfo:NULL
                                                      repeats:YES];
}

- (void)getSuggestion:(NSString*) suggestion {
    [self.game.suggestPhase addSuggestion:suggestion];
    self.team1CounterLabel.text = [NSString stringWithFormat:@"%lu", self.game.suggestPhase.team1Suggestions.count];
    self.team2CounterLabel.text = [NSString stringWithFormat:@"%lu", self.game.suggestPhase.team2Suggestions.count];
    if (self.game.suggestPhase.currentTurn % 2 == 0) {
        self.heartMonitor.image = [UIImage imageNamed:@"monitor_team 1"];
    } else {
        self.heartMonitor.image = [UIImage imageNamed:@"monitor_team 2"];
    }
    [self.sugestionsCollectionView reloadData];
    NSIndexPath* lastCellIndexPath = [NSIndexPath indexPathForItem:self.game.suggestPhase.team1Suggestions.count + self.game.suggestPhase.team2Suggestions.count - 1 inSection:0];
    [self.sugestionsCollectionView scrollToItemAtIndexPath:lastCellIndexPath
                                          atScrollPosition: UICollectionViewScrollPositionRight
                                                  animated:YES];
    [[self.sugestionsCollectionView cellForItemAtIndexPath:lastCellIndexPath] setNeedsFocusUpdate];
}

- (void)heartBeat {
    // Play Sound
    // Play animation
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"This is being executed!");
    
    SuggestionCollectionViewCell* cell = (SuggestionCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"suggestionCell" forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 0) {
        cell.suggestionLabel.text = self.game.suggestPhase.team1Suggestions[indexPath.row/2];

        cell.teamBoxImageView.image = [UIImage imageNamed:@"textbox_team 1"];
    } else {
        cell.suggestionLabel.text = self.game.suggestPhase.team2Suggestions[indexPath.row/2];
        
        cell.teamBoxImageView.image = [UIImage imageNamed:@"textbox_team 2"];
    }
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.game.suggestPhase.team1Suggestions.count + self.game.suggestPhase.team2Suggestions.count;
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
    return CGSizeMake(540, 270);
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
