//
//  Player.m
//  Sheepshead
//
//  Created by Christopher Hendrix on 5/22/15.
//  Copyright (c) 2015 Christopher Hendrix. All rights reserved.
//

#import "Player.h"

@interface Player ()

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSMutableArray *hands;

@end

@implementation Player

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
        self.hands = [NSMutableArray array];
    }
    return self;
}

- (NSString *)description
{
    return self.name;
}

- (NSString *)initials
{
    return self.name;
}

@end
