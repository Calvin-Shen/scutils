//
//  SCUtility.m
//  libscutils
//
//  Created by 沈宸 on 2018/12/6.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "SCUtility.h"

@implementation SCUtility
+ (instancetype)sharedInstance{
    static SCUtility *utility = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        utility = [[self alloc] init];
    });
    return utility;
}

- (UIImage *)sc_imageWithColor:(UIColor *) color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (NSUInteger)sc_fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager  = [NSFileManager defaultManager];
    NSDictionary *dic = [fileManager attributesOfItemAtPath:path error:nil];
    NSUInteger size = [dic fileSize];
    return size;
}

- (NSString *)sc_fileSizeWithByteCounts:(NSInteger)byteCounts{
    // 1k = 1024, 1m = 1024k
    if (byteCounts < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)byteCounts];
    }else if (byteCounts < 1024 * 1024){// 小于1m
        CGFloat aFloat = byteCounts/1024.0;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (byteCounts < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = byteCounts/(1024.0 * 1024.0);
        return [NSString stringWithFormat:@"%.2fM",aFloat];
    }else{
        CGFloat aFloat = byteCounts/(1024.0*1024.0*1024.0);
        return [NSString stringWithFormat:@"%.2fG",aFloat];
    }
}

- (UIImageView *)sc_findHairlineImageViewInNavigationBar:(UIView *)view
{
    if([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0f){
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self sc_findHairlineImageViewInNavigationBar:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

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
