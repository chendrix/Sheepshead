//
//  ScoresTableViewController.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/24/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "ScoresTableViewController.h"
#import "ScoreTableViewCell.h"
#import "Game.h"
#import "Player.h"
#import "Hand.h"

@interface ScoresTableViewController ()

@end

@implementation ScoresTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ScoreTableViewCell class] forCellReuseIdentifier:@"ScoreTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.game.players count] + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [self.game.players count];
    } else {
        return [self.game.hands count];
    }
}

#pragma mark - Table view delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScoreTableViewCell" forIndexPath:indexPath];
    
    if ([indexPath section] == 0) {
        // Game totals
        NSInteger playerIndex = [indexPath row];
        
        Player *player = self.game.players[playerIndex];
        
        NSInteger score = [self.game scoreForPlayer:player];
        
        cell.textLabel.text = player.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)score];
        
    } else {
        // Single players
        
        NSInteger handIndex = [indexPath row];
        NSInteger playerIndex = [indexPath section] - 1;
        
        Hand *hand = self.game.hands[handIndex];
        Player *player = self.game.players[playerIndex];
        
        NSInteger score = [hand scoreForPlayer:player];
        
        cell.textLabel.text = [NSString stringWithFormat:@"Hand %ld", handIndex + 1];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)score];
    }
    
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Game";
    } else {
        Player *player = self.game.players[section - 1];
        return [NSString stringWithFormat:@"%@", player.name];
    }
}

@end
