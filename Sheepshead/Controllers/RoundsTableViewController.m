//
//  RoundsTableViewController.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "RoundsTableViewController.h"
#import "GameSetupViewController.h"
#import "HandSetupViewController.h"
#import "HandResultViewController.h"
#import "Game.h"
#import "Hand.h"

@interface RoundsTableViewController ()

@end

@implementation RoundsTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = self.game.description;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    GameSetupViewController *gameSetupViewController = [[GameSetupViewController alloc] init];
    gameSetupViewController.roundsTableViewController = self;

    [self presentViewController:gameSetupViewController animated:YES completion:NULL];
    
    UINavigationItem *navItem = self.navigationItem;

    UIBarButtonItem *addNewRoundButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(setupNewHand:)];
    
    navItem.rightBarButtonItem = addNewRoundButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.game.handsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    Hand *hand = self.game.hands[indexPath.row];
    cell.textLabel.text = hand.description;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HandResultViewController *handResultViewController = [[HandResultViewController alloc] init];
    handResultViewController.hand = self.game.hands[indexPath.row];
    
    [self.navigationController pushViewController:handResultViewController animated:YES];
}

#pragma mark - Actions

- (IBAction)setupNewHand:(id)sender
{
    HandSetupViewController *hsvc = [[HandSetupViewController alloc] init];
    
    hsvc.game = self.game;
    hsvc.roundsTableViewController = self;
    
    [self presentViewController:hsvc animated:YES completion:NULL];
}

- (void)didCreateNewHand
{
    NSInteger lastRow = self.game.handsCount - 1;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}


@end
