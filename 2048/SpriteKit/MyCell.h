//
//  MyCell.h
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyTile;
@interface MyCell : NSObject

/** The position of the cell. */
@property (nonatomic) Position position;

/** The tile in the cell, if any. */
@property (nonatomic, strong) MyTile *tile;

/**
 * Initialize a MyCell at the specified position with no tile in it.
 *
 * @param position The position of the cell.
 */
- (instancetype)initWithPosition:(Position)position;

@end
