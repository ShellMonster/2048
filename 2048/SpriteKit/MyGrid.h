//
//  MyGrid.h
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCell.h"

@class MyScene;

typedef void (^IteratorBlock)(Position);

@interface MyGrid : NSObject

/** The dimension of the grid. */
@property (nonatomic, readonly) NSInteger dimension;

/** The scene in which the game happens. */
@property (nonatomic, weak) MyScene *scene;


/**
 * Initializes a new grid with the given dimension.
 *
 * @param dimension The desired dimension, i.e. # cells in a row or column.
 */
- (instancetype)initWithDimension:(NSInteger)dimension;


/**
 * Iterates over the grid and calls the block, which takes in the Position
 * of the current cell. Has the option to iterate in the reverse order.
 *
 * @param block The block to be applied to each cell position.
 * @param reverse If YES, iterate in the reverse order.
 */
- (void)forEach:(IteratorBlock)block reverseOrder:(BOOL)reverse;


/**
 * Returns the cell at the specified position.
 *
 * @param position The position we are interested in.
 * @return The cell at the position. If position out of bound, returns nil.
 */
- (MyCell *)cellAtPosition:(Position)position;


/**
 * Returns the tile at the specified position.
 *
 * @param position The position we are interested in.
 * @return The tile at the position. If position out of bound or cell empty, returns nil.
 */
- (MyTile *)tileAtPosition:(Position)position;


/**
 * Whether there are any available cells in the grid.
 *
 * @return YES if there are at least one cell available.
 */
- (BOOL)hasAvailableCells;


/**
 * Inserts a new tile at a randomly chosen position that's available.
 *
 * @param delay If YES, adds twice `animationDuration` long delay before the insertion.
 */
- (void)insertTileAtRandomAvailablePositionWithDelay:(BOOL)delay;


/**
 * Removes all tiles in the grid from the scene.
 *
 * @param animated If YES, animate the removal.
 */
- (void)removeAllTilesAnimated:(BOOL)animated;

@end
