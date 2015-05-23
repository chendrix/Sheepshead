//
//  Hand.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/23/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "Hand.h"

@interface Hand ()

@property (nonatomic, readwrite) NSUInteger number;
@property (nonatomic, weak, readwrite) Game *game;

@end

@implementation Hand

- (instancetype)initForGame:(Game *)game withNumber:(NSUInteger)number
{
    self = [super init];
    if (self) {
        self.game = game;
        self.number = number;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Hand %lu", self.number];
}
@end
