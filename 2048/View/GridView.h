//
//  GridView.h
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyGrid;
@interface GridView : UIView

/**
 * Create the entire background of the view with the grid at the correct position.
 *
 * @param grid The grid object that the image bases on.
 */
+ (UIImage *)gridImageWithGrid:(MyGrid *)grid;

/**
 * Create the entire background of the view with a translucent overlay on the grid.
 * The rest of the image is clear color, to create the illusion that the overlay is
 * only over the grid.
 */
+ (UIImage *)gridImageWithOverlay;

@end
