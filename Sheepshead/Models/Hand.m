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
@property (nonatomic) Boolean losersMadeSchneider;

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
        self.losersMadeSchneider = true;
    }
    return self;
}

- (void)pickingTeamWon:(Boolean)pickersWon losersMadeSchneider:(Boolean)losersMadeSchneider
{
    self.pickersWon = pickersWon;
    self.losersMadeSchneider = losersMadeSchneider;
}

- (NSInteger)scoreForPlayer:(Player *)player
{
    if (![self.playersSet containsObject:player]){
        return 0;
    }
    
    NSInteger score = [self baseScore];
    
    if (self.pickersWon) {
        if (player == self.picker) {
            return 2 * score;
        } else if (player == self.partner) {
            return 1 * score;
        } else {
            return -1 * score;
        }
    } else {
        if (player == self.picker) {
            return -2 * score;
        } else if (player == self.partner) {
            return -1 * score;
        } else {
            return 1 * score;
        }
    }
}

- (NSInteger)baseScore
{
    if (self.losersMadeSchneider) {
        return 1;
    } else {
        return 2;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Hand - Picker: %@, Partner: %@", [self.picker name], [self.partner name]];
}
@end
