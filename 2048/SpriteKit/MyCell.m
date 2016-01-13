//
//  MyCell.m
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "MyCell.h"
#import "MyTile.h"

@implementation MyCell

- (instancetype)initWithPosition:(Position)position {
    if (self = [super init]) {
        self.position = position;
        self.tile = nil;
    }
    return self;
}

- (void)setTile:(MyTile *)tile {
    _tile = tile;
    if (tile) tile.cell = self;
}

@end
