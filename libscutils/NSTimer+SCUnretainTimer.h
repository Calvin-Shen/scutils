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
 @brief 创建一个不使用target模式的timer，不会导致循环引用
 @param interval 以s计算
 @param repeats 是否循环
 @param block 希望循环执行的内容
 */
+ (NSTimer *)sc_scheduledTimerWithInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;
@end