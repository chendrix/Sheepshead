//
//  ScoresTableViewController.h
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/24/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Game;

@interface ScoresTableViewController : UITableViewController

@property (nonatomic, weak) Game *game;

@end
