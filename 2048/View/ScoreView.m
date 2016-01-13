//
//  ScoreView.m
//  2048
//
//  Created by dengwei on 15/12/17.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "ScoreView.h"

@implementation ScoreView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
        
        _title = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 108, 21)];
        _title.textColor = [UIColor whiteColor];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.font = [UIFont systemFontOfSize:11.0f];
        [self addSubview:_title];
        
        _score = [[UILabel alloc] initWithFrame:CGRectMake(0, 29, 140, 21)];
        _score.textColor = [UIColor whiteColor];
        _score.font = [UIFont systemFontOfSize:16.0f];
        _score.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_score];
    }
    
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}


- (void)commonInit
{
    self.layer.cornerRadius = GSTATE.cornerRadius;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor greenColor];
}


- (void)updateAppearance
{
    self.backgroundColor = [GSTATE scoreBoardColor];
    self.title.font = [UIFont fontWithName:[GSTATE boldFontName] size:12];
    self.score.font = [UIFont fontWithName:[GSTATE regularFontName] size:16];
}

@end
