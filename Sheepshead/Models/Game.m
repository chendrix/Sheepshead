//
//  Game.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/22/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "Game.h"

#import "Underscore.h"
#define _ Underscore

#import "Player.h"
#import "Hand.h"

@interface Game ()

@property (nonatomic, copy, readwrite) NSArray *players;
@property (nonatomic, strong, readwrite) NSMutableArray *hands;

@end

@implementation Game

- (instancetype)initWithPlayerNames:(NSArray *)playerNames
{
    self = [super init];
    if (self) {
        NSMutableArray *players = [[NSMutableArray alloc] initWithCapacity:5];
        
        for (NSString *name in playerNames) {
            [players addObject:[[Player alloc] initWithName:name]];
        }
        
        self.players = players;
        self.hands = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Game: %@", [self.playerDescriptions componentsJoinedByString:@", "]];
}

- (Hand *)createNewHand
{
    Hand *newHand = [[Hand alloc] initForGame:self withNumber:self.nextHandNumber];
    [self.hands addObject:newHand];
    
    return newHand;
}

#pragma mark - Helpers

- (NSArray *)playerDescriptions
{
    __block int i;
    i = 0;
    
    NSArray *playerDescriptions = _.array(self.players).map(^(Player *player) {
        i++;
        
        NSString *playerDescription = [NSString stringWithFormat:@"Player %i - %@", i, player.description];
        return playerDescription;
    }).unwrap;
    
    return playerDescriptions;
}

- (NSUInteger)nextHandNumber
{
    return [self.hands count] + 1;
}

- (NSUInteger)handsCount
{
    return [self.hands count];
}

@end
