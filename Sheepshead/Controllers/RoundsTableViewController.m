//
//  RoundsTableViewController.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "RoundsTableViewController.h"
#import "GameSetupViewController.h"
#import "Game.h"
#import "Hand.h"

@interface RoundsTableViewController ()

@property (nonatomic, strong) GameSetupViewController *gameSetupViewController;
@end

@implementation RoundsTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        GameSetupViewController *gameSetupViewController = [[GameSetupViewController alloc] init];
        gameSetupViewController.roundsTableViewController = self;
        self.gameSetupViewController = gameSetupViewController;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = self.game.description;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    [self presentViewController:self.gameSetupViewController animated:YES completion:NULL];
    
    UINavigationItem *navItem = self.navigationItem;

    UIBarButtonItem *addNewRoundButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewHand:)];
    
    navItem.rightBarButtonItem = addNewRoundButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.game.handsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    Hand *hand = [self.game.hands objectAtIndex:indexPath.row];
    cell.textLabel.text = hand.description;
    
    return cell;
}

#pragma mark - Actions

- (IBAction)addNewHand:(id)sender
{
    [self.game createNewHand];
    
    NSInteger lastRow = self.game.handsCount - 1;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}


@end
