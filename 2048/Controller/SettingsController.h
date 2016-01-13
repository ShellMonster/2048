//
//  SettingsController.h
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsDelegate <NSObject>
@required
/**
 *  更新设置数据
 */
-(void)update;
@end

@interface SettingsController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign)id <SettingsDelegate>   delegate;

@end
