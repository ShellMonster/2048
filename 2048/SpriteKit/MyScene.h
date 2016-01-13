//
//  MyScene.h
//  2048
//
//  Created by dengwei on 15/12/23.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class MyGrid;
@class ViewController;

@interface MyScene : SKScene

@property (nonatomic, weak) ViewController *controller;

- (void)startNewGame;

- (void)loadBoardWithGrid:(MyGrid *)grid;

@end
