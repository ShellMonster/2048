//
//  Common.h
//  2048
//
//  Created by dengwei on 15/12/13.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#ifndef _2048_Common_h
#define _2048_Common_h

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define HEX(c)       [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]

//自定义日志输出
#ifdef DEBUG
//调试状态
#define XLog(...) NSLog(@"%s line:%d\n %@ \n\n", __func__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
//发布状态
#define XLog(...)
#endif

#endif
