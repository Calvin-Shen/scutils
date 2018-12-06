//
//  NSTimer+SCUnretainTimer.m
//  ZaoYin
//
//  Created by 沈宸 on 2018/10/31.
//  Copyright © 2018 Kunsound. All rights reserved.
//

#import "NSTimer+SCUnretainTimer.h"

@implementation NSTimer (SCUnretainTimer)
+ (NSTimer *)sc_scheduledTimerWithInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block{
    return [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(p_blockInvoke:) userInfo:block repeats:repeats];
}

+ (void)p_blockInvoke:(NSTimer *)timer{
    void (^block)(NSTimer *) = timer.userInfo;
    if (block) {
        block(timer);
    }
}
@end
