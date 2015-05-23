//
//  Game.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/22/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "Game.h"
#import "Player.h"

@interface Game ()

@property (nonatomic, copy, readwrite) NSSet *players;

@end

@implementation Game

- (instancetype)initWithPlayerNames:(NSArray *)playerNames
{
    self = [super init];
    if (self) {
        NSMutableSet *players = [[NSMutableSet alloc] initWithCapacity:5];
        
        for (NSString *name in playerNames) {
            [players addObject:[[Player alloc] initWithName:name]];
        }
        
        self.players = players;
    }
    return self;

}


@end
