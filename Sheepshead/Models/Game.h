//
//  Game.h
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/22/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic, copy, readonly) NSSet *players;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithPlayerNames:(NSArray *)playerNames NS_DESIGNATED_INITIALIZER;

@end
