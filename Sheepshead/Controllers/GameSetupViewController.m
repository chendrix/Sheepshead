//
//  GameSetupViewController.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "GameSetupViewController.h"
#import "Game.h"

@interface GameSetupViewController ()

@property (weak, nonatomic) IBOutlet UITextField *player1Name;
@property (weak, nonatomic) IBOutlet UITextField *player2Name;
@property (weak, nonatomic) IBOutlet UITextField *player3Name;
@property (weak, nonatomic) IBOutlet UITextField *player4Name;
@property (weak, nonatomic) IBOutlet UITextField *player5Name;

@property (nonatomic, strong) Game *game;

@end

@implementation GameSetupViewController

- (IBAction)createGame:(id)sender {
    
    NSArray *playerNames = [[NSArray alloc]
                            initWithObjects:
                            self.player1Name.text,
                            self.player2Name.text,
                            self.player3Name.text,
                            self.player4Name.text,
                            self.player5Name.text,
                            nil];
    
    self.game = [[Game alloc] initWithPlayerNames:playerNames];
    NSLog(@"Game - %@", self.game.description);
}

@end
