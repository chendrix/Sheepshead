//
//  Hand.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "Hand.h"
#import "Player.h"

@interface Hand ()

@property (nonatomic, weak, readwrite) Game *game;
@property (nonatomic, weak, readwrite) NSArray *players;
@property (nonatomic, strong, readwrite) NSSet *playersSet;
@property (nonatomic, weak, readwrite) Player *picker;
@property (nonatomic, weak, readwrite) Player *partner;
@property (nonatomic) Boolean pickersWon;
@property (nonatomic, readwrite) Boolean isFinished;

@end

@implementation Hand

- (instancetype)initForGame:(Game *)game withPlayers:(NSArray *)players picker:(Player *)picker partner:(Player *)partner
{
    self = [super init];
    if (self) {
        self.game = game;
        self.players = players;
        self.playersSet = [NSSet setWithArray:self.players];
        
        for (Player *player in self.players) {
            [player.hands addObject:self];
        }
        
        self.picker = picker;
        self.partner = partner;
        self.isFinished = false;
    }
    return self;
}

- (void)pickingTeamWon
{
    self.isFinished = true;
    self.pickersWon = true;
}

- (void)opposingTeamWon
{
    self.isFinished = true;
    self.pickersWon = false;
}

- (NSInteger)scoreForPlayer:(Player *)player
{
    if ([self.playersSet containsObject:player]) {
        if (self.pickersWon) {
            if (player == self.picker) {
                return 2;
            } else if (player == self.partner) {
                return 1;
            } else {
                return -1;
            }
        } else {
            if (player == self.picker) {
                return -2;
            } else if (player == self.partner) {
                return -1;
            } else {
                return 1;
            }
        }
    } else {
       return 0;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Hand - Picker: %@, Partner: %@", [self.picker name], [self.partner name]];
}
@end
