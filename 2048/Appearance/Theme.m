//
//  Theme.m
//  2048
//
//  Created by dengwei on 15/12/23.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "Theme.h"
#import "DefaultTheme.h"
#import "LightTheme.h"
#import "WarmTheme.h"

@implementation Theme

+ (Class)themeClassForType:(NSInteger)type
{
    switch (type) {
        case 1:
            return [LightTheme class];
        case 2:
            return [WarmTheme class];
        default:
            return [DefaultTheme class];
    }
}

@end
