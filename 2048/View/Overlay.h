//
//  Overlay.h
//  2048
//
//  Created by dengwei on 15/12/17.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Overlay : UIView

@property (nonatomic, copy) UILabel *message;

@property (nonatomic, copy) UIButton *keepPlaying;

@property (nonatomic, copy) UIButton *restartGame;

@end
