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
 返回全局的SCUtility的单例
 
 @return 单例对象
 */
+ (instancetype)sharedInstance;

/**
 用颜色创建一张图片
 
 @param color 指定的颜色
 @return 一个以color为颜色的图片，大小为1个像素
 */
- (UIImage *)sc_imageWithColor:(UIColor *) color;

/**
 删除NSUserDefaults中的所有记录
 */
- (void)sc_resetUserDefaults;


/**
 跳转到app store的下载应用评分页面
 
 @param idString 字符串类型的app ID上架时创建appID (纯数字，不是bundleID)
 */
- (void)sc_goToAppStoreScoreWithId:(NSString *)idString;
@end

NS_ASSUME_NONNULL_END
