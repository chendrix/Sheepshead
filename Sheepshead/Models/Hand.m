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
@property (nonatomic, weak, readwrite) Player *picker;
@property (nonatomic, weak, readwrite) Player *partner;
@property (nonatomic) Boolean pickersWon;

@end

@implementation Hand

- (instancetype)initForGame:(Game *)game withPlayers:(NSArray *)players picker:(Player *)picker partner:(Player *)partner
{
    self = [super init];
    if (self) {
        self.game = game;
        self.players = players;
        
        for (Player *player in self.players) {
            [player.hands addObject:self];
        }
        
        self.picker = picker;
        self.partner = partner;
    }
    return self;
}

- (void)pickingTeamWon
{
    self.pickersWon = true;
}

- (void)opposingTeamWon
{
    self.pickersWon = false;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Hand - Picker: %@, Partner: %@", [self.picker name], [self.partner name]];
}
@end
