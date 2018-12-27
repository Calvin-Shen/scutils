//
//  SCUtility+DelayTask.h
//  libscutils
//
//  Created by 沈宸 on 2018/12/7.
//  Copyright © 2018 沈宸. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SCUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCUtility (DelayTask)
/**
 创建一个延时执行的任务
 
 @param block 需要延时执行的任务内容
 @return 返回一个延时执行的句柄
 */
- (dispatch_block_t)sc_performBlock:(dispatch_block_t)block delayMilliSeconds:(NSUInteger)delayMilliSeconds;

/**
 取消延时任务
 
 @praram block 需要取消的延时任务句柄,不能传空值
 */
- (void)sc_cancelDelayBlock:(dispatch_block_t)block;
@end

NS_ASSUME_NONNULL_END
