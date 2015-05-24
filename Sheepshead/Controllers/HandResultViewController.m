//
//  HandResultViewController.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "HandResultViewController.h"
#import "Hand.h"

@interface HandResultViewController ()

@end

@implementation HandResultViewController

- (IBAction)pickersWon:(id)sender {
    [self.hand pickingTeamWon];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)opponentsWon:(id)sender {
    [self.hand opposingTeamWon];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
