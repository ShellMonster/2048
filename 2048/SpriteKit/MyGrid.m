//
//  MyGrid.m
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#include "stdlib.h"

#import "MyGrid.h"
#import "MyTile.h"
#import "MyScene.h"

@interface MyGrid ()

@property (nonatomic, readwrite) NSInteger dimension;

@end


@implementation MyGrid {
    /* The 2-D grid that keeps track of all cells and tiles. */
    NSMutableArray *_grid;
}

- (instancetype)initWithDimension:(NSInteger)dimension {
    if (self = [super init]) {
        // Set up the grid with all empty cells.
        _grid = [[NSMutableArray alloc] initWithCapacity:dimension];
        
        for (NSInteger i = 0; i < dimension; i++) {
            NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:dimension];
            for (NSInteger j = 0; j < dimension; j++) {
                [array addObject:[[MyCell alloc] initWithPosition:PositionMake(i, j)]];
            }
            [_grid addObject:array];
        }
        
        // Record the dimension of the grid.
        self.dimension = dimension;
    }
    
    return self;
}


#pragma mark - Iterator

- (void)forEach:(IteratorBlock)block reverseOrder:(BOOL)reverse {
    if (!reverse) {
        for (NSInteger i = 0; i < self.dimension; i++)
            for (NSInteger j = 0; j < self.dimension; j++)
                block(PositionMake(i, j));
    } else {
        for (NSInteger i = self.dimension - 1; i >= 0; i--)
            for (NSInteger j = self.dimension - 1; j >= 0; j--)
                block(PositionMake(i, j));
    }
}


#pragma mark - Position helpers

- (MyCell *)cellAtPosition:(Position)position {
    if (position.x >= self.dimension || position.y >= self.dimension ||
        position.x < 0 || position.y < 0) return nil;
    return [[_grid objectAtIndex:position.x] objectAtIndex:position.y];
}


- (MyTile *)tileAtPosition:(Position)position {
    MyCell *cell = [self cellAtPosition:position];
    return cell ? cell.tile : nil;
}


#pragma mark - Cell availability

- (BOOL)hasAvailableCells {
    return [self availableCells].count != 0;
}


/**
 * Returns a randomly chosen cell that's available.
 *
 * @return A randomly chosen available cell, or nil if no cell is available.
 */
- (MyCell *)randomAvailableCell {
    NSArray *availableCells = [self availableCells];
    if (availableCells.count) {
        return [availableCells objectAtIndex:arc4random_uniform((int)availableCells.count)];
    }
    return nil;
}


/**
 * Returns all available cells in an array.
 *
 * @return The array of all available cells. If no cell is available, returns empty array.
 */
- (NSArray *)availableCells {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:self.dimension * self.dimension];
    [self forEach:^(Position position) {
        MyCell *cell = [self cellAtPosition:position];
        if (!cell.tile) [array addObject:cell];
    } reverseOrder:NO];
    return array;
}


#pragma mark - Cell manipulation

- (void)insertTileAtRandomAvailablePositionWithDelay:(BOOL)delay {
    MyCell *cell = [self randomAvailableCell];
    if (cell) {
        MyTile *tile = [MyTile insertNewTileToCell:cell];
        [self.scene addChild:tile];
        
        SKAction *delayAction = delay ? [SKAction waitForDuration:GSTATE.animationDuration * 3] :
        [SKAction waitForDuration:0];
        SKAction *move = [SKAction moveBy:CGVectorMake(- GSTATE.tileSize / 2, - GSTATE.tileSize / 2)
                                 duration:GSTATE.animationDuration];
        SKAction *scale = [SKAction scaleTo:1 duration:GSTATE.animationDuration];
        [tile runAction:[SKAction sequence:@[delayAction, [SKAction group:@[move, scale]]]]];
    }
}


- (void)removeAllTilesAnimated:(BOOL)animated {
    [self forEach:^(Position position) {
        MyTile *tile = [self tileAtPosition:position];
        if (tile) [tile removeAnimated:animated];
    } reverseOrder:NO];
}

@end
