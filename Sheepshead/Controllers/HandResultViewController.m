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

@property (weak, nonatomic) IBOutlet UISwitch *losersMadeSchneiderSwitch;

@end

@implementation HandResultViewController

- (IBAction)pickersWon:(id)sender {
    
    [self.hand pickingTeamWon:YES losersMadeSchneider:[self losersMadeSchneider]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)opponentsWon:(id)sender {
        [self.hand pickingTeamWon:NO losersMadeSchneider:[self losersMadeSchneider]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (Boolean)losersMadeSchneider {
    return self.losersMadeSchneiderSwitch.on;
}

@end
