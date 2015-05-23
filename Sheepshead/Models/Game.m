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
        self.hands = [NSMutableArray array];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Game: %@", [self.playerDescriptions componentsJoinedByString:@", "]];
}

- (Hand *)createNewHandWithPicker:(Player *)picker partner:(Player *)partner
{
    Hand *newHand = [[Hand alloc] initForGame:self withPlayers:self.players picker:picker partner:partner];
    [self.hands addObject:newHand];
    
    return newHand;
}

#pragma mark - Helpers

- (NSArray *)playerDescriptions
{
    __block int i = 0;
    
    NSArray *playerDescriptions = _.array(self.players).map(^(Player *player) {
        i++;
        
        NSString *playerDescription = [NSString stringWithFormat:@"Player %i - %@", i, player.description];
        return playerDescription;
    }).unwrap;
    
    return playerDescriptions;
}

- (NSArray *)handDescriptions
{
    __block int i = 0;
    
    NSArray *handDescriptions = _.array(self.hands).map(^(Hand *hand) {
        i++;
        
        NSString *handDescription = [NSString stringWithFormat:@"Hand %i - %@", i, hand.description];
        return handDescription;
    }).unwrap;
    
    return handDescriptions;
}

- (NSUInteger)handsCount
{
    return [self.hands count];
}

@end
