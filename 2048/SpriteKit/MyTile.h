//
//  MyTile.h
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class MyCell;
@interface MyTile : SKShapeNode

/** The level of the tile. */
@property (nonatomic) NSInteger level;

/** The cell this tile belongs to. */
@property (nonatomic, weak) MyCell *cell;

/**
 * Creates and inserts a new tile at the specified cell.
 *
 * @param cell The cell to insert tile into.
 * @return The tile created.
 */
+ (MyTile *)insertNewTileToCell:(MyCell *)cell;

- (void)commitPendingActions;

/**
 * Whether this tile can merge with the given tile.
 *
 * @param tile The target tile to merge with.
 * @return YES if the two tiles can be merged.
 */
- (BOOL)canMergeWithTile:(MyTile *)tile;


/**
 * Checks whether this tile can merge with the given tile, and merge them
 * if possible. The resulting tile is at the position of the given tile.
 *
 * @param tile Target tile to merge into.
 * @return The resulting level of the merge, or 0 if unmergeable.
 */
- (NSInteger)mergeToTile:(MyTile *)tile;

- (NSInteger)merge3ToTile:(MyTile *)tile andTile:(MyTile *)furtherTile;

/**
 * Moves the tile to the specified cell. If the tile is not already in the grid,
 * calling this method would result in error.
 *
 * @param cell The destination cell.
 */
- (void)moveToCell:(MyCell *)cell;


/**
 * Removes the tile from its cell and from the scene.
 *
 * @param animated If YES, the removal will be animated.
 */
- (void)removeAnimated:(BOOL)animated;

@end
