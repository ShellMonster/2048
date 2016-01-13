//
//  Overlay.m
//  2048
//
//  Created by dengwei on 15/12/17.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "Overlay.h"

@implementation Overlay

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _message = [[UILabel alloc] initWithFrame:CGRectMake(0, 24, 200, 58)];
        _message.textColor = [UIColor blackColor];
        _message.text = @"You Win!";
        _message.textAlignment = NSTextAlignmentCenter;
        _message.font = [UIFont systemFontOfSize:36.0f];
        [self addSubview:_message];
        
        _keepPlaying = [[UIButton alloc] initWithFrame:CGRectMake(26, 128, 148, 30)];
        [_keepPlaying setTitle:@"Keep Playing" forState:UIControlStateNormal];
        [self addSubview:_keepPlaying];
        
        _restartGame = [[UIButton alloc] initWithFrame:CGRectMake(26, 90, 148, 30)];
        [_restartGame setTitle:@"New Game" forState:UIControlStateNormal];
        [self addSubview:_restartGame];
    }
    
    return self;
}

@end
