//
//  Game.h
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/22/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Hand;
@class Player;

@interface Game : NSObject

@property (nonatomic, copy, readonly) NSArray *players;
@property (nonatomic, strong, readonly) NSMutableArray *hands;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithPlayerNames:(NSArray *)playerNames NS_DESIGNATED_INITIALIZER;
- (Hand *)createNewHandWithPicker:(Player *)picker partner:(Player *)partner;
- (NSUInteger)handsCount;
- (NSInteger)scoreForPlayer:(Player *)player;

@end
