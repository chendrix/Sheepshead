//
//  Hand.h
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Game;

@interface Hand : NSObject

@property (nonatomic, readonly) NSUInteger number;
@property (nonatomic, weak, readonly) Game *game;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initForGame:(Game *)game withNumber:(NSUInteger)number NS_DESIGNATED_INITIALIZER;

@end
