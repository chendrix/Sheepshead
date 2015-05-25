//
//  RoundsTableViewController.h
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Game;
@class ScoresTableViewController;

@interface RoundsTableViewController : UITableViewController

@property (nonatomic, strong) Game *game;
@property (nonatomic, strong) ScoresTableViewController *scoresViewController;

- (void)didCreateNewHand;

@end
