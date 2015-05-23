//
//  Game.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/22/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "Game.h"
#import "Player.h"
#import "Underscore.h"
#define _ Underscore

@interface Game ()

@property (nonatomic, copy, readwrite) NSArray *players;

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
    }
    return self;
}

- (NSString *)description
{
    return [self.playerDescriptions componentsJoinedByString:@"\n"];
}

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

@end
