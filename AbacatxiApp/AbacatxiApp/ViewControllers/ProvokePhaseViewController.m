//
//  ProvokePhaseViewController.m
//  AbacatxiApp
//
//  Created by Augusto Queiroz on 26/09/18.
//  Copyright © 2018 Augusto Queiroz. All rights reserved.
//

#import "ProvokePhaseViewController.h"
#import "MPCHandler.h"
#import "Game.h"

@interface ProvokePhaseViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *team1TimerLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2TimerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *heartMonitor;
@property (weak, nonatomic) IBOutlet UILabel *team1CounterLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2CounterLabel;
@property (weak, nonatomic) IBOutlet UILabel *sugestionLabel;
@property (weak, nonatomic) IBOutlet UIView *endOfPhaseView;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIImageView *teamBoxImageView;
@property (weak, nonatomic) IBOutlet UILabel *team1ProvocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2ProvocationLabel;

@property Game* game;

@property NSTimer* heartTimer;

@property NSMutableArray* team1ProvokedSuggestions;
@property NSMutableArray* team2ProvokedSuggestions;

@property Provocation* provocation;

@end

@implementation ProvokePhaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Get game
    self.game = [Game sharedManager];
    
    // View Setup
    self.descriptionLabel.text = self.game.problem;
    self.team1TimerLabel.text = @"03:00"; self.team2TimerLabel.text = @"03:00";
    self.team1CounterLabel.textColor = [UIColor colorWithRed:((float)(0xF9 / 255.0))
                                                       green:((float)(0xE5 / 255.0))
                                                        blue:((float)(0x65 / 255.0))
                                                       alpha:1.0];
    self.team2CounterLabel.textColor = [UIColor colorWithRed:((float)(0x69 / 255.0))
                                                       green:((float)(0xA3 / 255.0))
                                                        blue:((float)(0xBC / 255.0))
                                                       alpha:1.0];
    
    // Start Phase
    [self.game.provokePhase startPhaseWithTarget:self];
    [self presentProvocation];
    
    // Make view controller expect notifications from iPhone
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleReceivedDataNotification:) name:@"Abacatxi_DidReceiveDataNotification" object:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)presentProvocation {
    int index;
    NSString* suggestion;
    if (self.game.provokePhase.currentTurn % 2 == 1) {
        // Team 1's turn
        self.teamBoxImageView.image = [UIImage imageNamed:@"textbox_team 1"];
        self.team2ProvocationLabel.text = @"";
        
        do {
            index = arc4random() % self.game.suggestPhase.team1Suggestions.count;
        } while ((BOOL) self.team1ProvokedSuggestions[index] == YES);
        
        suggestion = self.game.suggestPhase.team1Suggestions[index];
        self.provocation = [Provocation provocationFromSuggestion:suggestion];
        
        switch (self.provocation.type) {
            case Exageration:
                self.team1ProvocationLabel.text = @"Exagerate";
                break;
                
            case Revertion:
                self.team1ProvocationLabel.text = @"Revert";
                break;
                
            case Invertion:
                self.team1ProvocationLabel.text = @"Invert";
                break;
            
            default:
                self.team1ProvocationLabel.text = @"Bug";
        }
    } else {
        // Team 2's turn
        self.teamBoxImageView.image = [UIImage imageNamed:@"textbox_team 2"];
        self.team1ProvocationLabel.text = @"";
        
        do {
            index = arc4random() % self.game.suggestPhase.team2Suggestions.count;
        } while ((BOOL) self.team2ProvokedSuggestions[index] == YES);
        
        suggestion = self.game.suggestPhase.team2Suggestions[index];
        self.provocation = [Provocation provocationFromSuggestion:suggestion];
        
        switch (self.provocation.type) {
            case Exageration:
                self.team2ProvocationLabel.text = @"Exagerate";
                break;
                
            case Revertion:
                self.team2ProvocationLabel.text = @"Revert";
                break;
                
            case Invertion:
                self.team2ProvocationLabel.text = @"Invert";
                break;
                
            default:
                self.team2ProvocationLabel.text = @"Bug";
        }
    }
    
    self.sugestionLabel.text = suggestion;
}

- (void)team1TimerUpdate: (NSTimer*)sender {
    [self.heartTimer invalidate];
    NSInteger remainingTime = --self.game.suggestPhase.team1RemainingTime;
    NSInteger minutes = remainingTime / 60;
    NSInteger seconds = remainingTime - (60*minutes);
    self.team1TimerLabel.text = [NSString stringWithFormat: @"%02lu:%02lu", minutes, seconds];
    
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

- (void)handleReceivedDataNotification:(NSNotification*) notification {
    NSDictionary *userInfoDict = [notification userInfo];
    NSData *receivedData = [userInfoDict objectForKey:@"data"];
    NSString *stringReceived = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    MCPeerID *senderPeerID = [userInfoDict objectForKey:@"peerID"];
    NSString *senderName = senderPeerID.displayName;
    [self getProvocation:stringReceived];
}

- (void)getProvocation:(NSString*) provocation {
    self.provocation.provocation = provocation;
    [self.game.provokePhase addProvocation:self.provocation];
    self.team1CounterLabel.text = [NSString stringWithFormat:@"%lu", self.game.suggestPhase.team1Suggestions.count];
    self.team2CounterLabel.text = [NSString stringWithFormat:@"%lu", self.game.suggestPhase.team2Suggestions.count];
    if (self.game.suggestPhase.currentTurn % 2 == 0) {
        self.heartMonitor.image = [UIImage imageNamed:@"monitor_team 1"];
    } else {
        self.heartMonitor.image = [UIImage imageNamed:@"monitor_team 2"];
    }
}

- (void)heartBeat {
    // Play Sound
    // Play animation
}

@end
