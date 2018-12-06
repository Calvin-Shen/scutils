//
//  SCUtility.h
//  libscutils
//
//  Created by 沈宸 on 2018/12/6.
//  Copyright © 2018 沈宸. All rights reserved.
//

/**
 获取SCUtility单例
 */
#define SCUtils [SCUtility sharedInstance]

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCUtility : NSObject
/**
 单例模式
 */
+ (instancetype)sharedInstance;

/**
 @brief 用颜色创建一张图片
 @param color 指定的颜色
 */
- (UIImage *)sc_imageWithColor:(UIColor *) color;

/**
 @brief 计算指定路径的文件大小
 @param path 文件路径
 */
- (NSUInteger)sc_fileSizeAtPath:(NSString *)path;

/**
 @brief 根据字节数返回一个反应文件大小的字符串 i.e. 比如1024个字节就返回@"1K" 1024*1024f个字节返回@"1.00M" 1024* 1024 * 1024返回@"1.00G"
 @param byteCounts 文件字节数
 */
- (NSString *)sc_fileSizeWithByteCounts:(NSInteger)byteCounts;

/**
 @brief 找出navigationBar中的下划线
 @param view 可以传入NavigationBar
 */
- (UIImageView *)sc_findHairlineImageViewInNavigationBar:(UIView *)view;

/**
 @brief 创建一个延时执行的任务
 @param block 需要延时执行的任务内容
 @return 返回一个延时执行句柄
 */
- (dispatch_block_t)sc_performBlock:(dispatch_block_t)block delayMilliSeconds:(NSUInteger)delayMilliSeconds;

/**
 @brief 取消延时任务
 @praram block 需要取消的延时任务句柄,不能传空值
 */
- (void)sc_cancelDelayBlock:(dispatch_block_t)block;
@end

NS_ASSUME_NONNULL_END
