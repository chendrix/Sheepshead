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
    return [self.game.players count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.game.hands count];
}

#pragma mark - Table view delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScoreTableViewCell" forIndexPath:indexPath];
    
    NSInteger handIndex = [indexPath row];
    NSInteger playerIndex = [indexPath section];
    
    Hand *hand = self.game.hands[handIndex];
    Player *player = self.game.players[playerIndex];
    
    NSInteger score = [hand scoreForPlayer:player];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Hand %ld", handIndex + 1];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", (long)score];
    
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Player *player = self.game.players[section];
    return [NSString stringWithFormat:@"%@", player.name];
}

@end
