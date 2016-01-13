//
//  SettingsDetailController.h
//  2048
//
//  Created by dengwei on 15/12/24.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsDetailController : UITableViewController

@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong) NSString *footer;
@property (nonatomic, strong) NSString *name;

@end
