//
//  LightTheme.m
//  2048
//
//  Created by dengwei on 15/12/23.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "LightTheme.h"

@implementation LightTheme

+ (UIColor *)colorForLevel:(NSInteger)level
{
    switch (level) {
        case 1:
            return RGB(254, 223, 180);
        case 2:
            return RGB(254, 183, 143);
        case 3:
            return RGB(253, 187, 45);
        case 4:
            return RGB(253, 157, 40);
        case 5:
            return RGB(246, 124, 95);
        case 6:
            return RGB(217, 70, 119);
        case 7:
            return RGB(210, 65, 97);
        case 8:
            return RGB(207, 50, 90);
        case 9:
            return RGB(205, 35, 84);
        case 10:
            return RGB(200, 30, 78);
        case 11:
            return RGB(190, 20, 70);
        case 12:
            return RGB(254, 233, 78);
        case 13:
            return RGB(249, 191, 64);
        case 14:
            return RGB(247, 167, 56);
        case 15:
        default:
            return RGB(244, 138, 48);
    }
}


+ (UIColor *)textColorForLevel:(NSInteger)level
{
    switch (level) {
        case 1:
        case 2:
            return RGB(180, 110, 90);
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        default:
            return [UIColor whiteColor];
    }
}


+ (UIColor *)backgroundColor
{
    return RGB(240, 240, 240);
}


+ (UIColor *)boardColor
{
    return RGB(240, 240, 240);
}


+ (UIColor *)scoreBoardColor
{
    return RGB(253, 144, 38);
}


+ (UIColor *)buttonColor
{
    return RGB(105, 35, 85);
}


+ (NSString *)boldFontName
{
    return @"AvenirNext-DemiBold";
}


+ (NSString *)regularFontName
{
    return @"AvenirNext-Regular";
}

@end
