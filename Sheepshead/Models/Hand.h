//
//  Hand.h
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Game;
@class Player;

@interface Hand : NSObject

@property (nonatomic, weak, readonly) Game *game;
@property (nonatomic, weak, readonly) NSArray *players;
@property (nonatomic, weak, readonly) Player *picker;
@property (nonatomic, weak, readonly) Player *partner;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initForGame:(Game *)game withPlayers:(NSArray *)players  picker:(Player *)picker partner:(Player *)partner NS_DESIGNATED_INITIALIZER;
- (void)pickingTeamWon;
- (void)opposingTeamWon;

@end
