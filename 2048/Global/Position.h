//
//  Position.h
//  2048
//
//  Created by dengwei on 15/12/13.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#ifndef _2048_Position_h
#define _2048_Position_h

typedef struct Position {
    NSInteger x;
    NSInteger y;
} Position;

CG_INLINE Position PositionMake(NSInteger x, NSInteger y) {
    Position position;
    position.x = x; position.y = y;
    return position;
}

#endif
