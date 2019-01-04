//
//  NSTimer+SCUnretainTimer.h
//  ZaoYin
//
//  Created by 沈宸 on 2018/10/31.
//  Copyright © 2018 Kunsound. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSTimer (SCUnretainTimer)
/**
 创建一个不使用target模式的timer，不会导致循环引用,没有系统限制要求
 
 @param interval 以s计算
 @param repeats 是否循环
 @param block 希望循环执行的内容
 @return 定时器对象
 */
+ (NSTimer *)sc_scheduledTimerWithInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;
@end
