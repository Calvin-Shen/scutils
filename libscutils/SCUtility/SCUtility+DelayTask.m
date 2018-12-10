//
//  SCUtility+DelayTask.m
//  libscutils
//
//  Created by 沈宸 on 2018/12/7.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "SCUtility+DelayTask.h"

@implementation SCUtility (DelayTask)
- (dispatch_block_t)sc_performBlock:(dispatch_block_t)block delayMilliSeconds:(NSUInteger)delayMilliSeconds{
    __block dispatch_block_t blockToExecute = [block copy];
    // gcd定时器
    __block dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_time_t time = dispatch_walltime(NULL, delayMilliSeconds * NSEC_PER_MSEC);
    dispatch_source_set_timer(timer, time, delayMilliSeconds * NSEC_PER_MSEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        blockToExecute();
        dispatch_cancel(timer);
    });
    dispatch_resume(timer);
    
    __block dispatch_block_t delayHandleCopy = nil;
    
    dispatch_block_t delayHandle = ^(void){
#if !__has_feature(objc_arc)
        [blockToExecute release];
        [delayHandleCopy release];
        dispatch_cancel(timer);
#endif
        blockToExecute = nil;
        delayHandleCopy = nil;
        dispatch_cancel(timer);
    };
    delayHandleCopy = [delayHandle copy];
    return delayHandleCopy;
}

- (void)sc_cancelDelayBlock:(dispatch_block_t)block{
    NSAssert(block, @"delayBlockHandle不能为空");
    block();
}
@end
