//
//  HandSetupViewController.h
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RoundsTableViewController;
@class Game;
@class Player;

@interface HandSetupViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, weak) RoundsTableViewController *roundsTableViewController;
@property (nonatomic, strong) Game *game;
@property (nonatomic, readonly) Player *selectedPicker;
@property (nonatomic, readonly) Player *selectedPartner;


@end
