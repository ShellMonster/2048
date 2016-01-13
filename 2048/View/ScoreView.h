//
//  ScoreView.h
//  2048
//
//  Created by dengwei on 15/12/17.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreView : UIView

@property (nonatomic, copy) UILabel *title;
@property (nonatomic, copy) UILabel *score;

/** Updates the appearance of subviews and itself. */
- (void)updateAppearance;

@end
