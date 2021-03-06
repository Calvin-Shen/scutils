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
@end

NS_ASSUME_NONNULL_END
