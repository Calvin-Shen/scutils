//
//  SCCommonMacros.h
//  libscutils
//
//  Created by 沈宸 on 2018/12/6.
//  Copyright © 2018 沈宸. All rights reserved.
//

#ifndef SCCommonMacros_h
#define SCCommonMacros_h

/**
 获取屏幕的宽和高
 */
#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height

/**
 获取导航栏高度
 */
#define NAVI_HEIGHT           [UIApplication sharedApplication].statusBarFrame.size.height + 44

/**
 获取当前屏幕相对于inphone6的宽高比
 */
#define ScreenScaleX            SCREEN_WIDTH/375.0
#define ScreenScaleY            SCREEN_HEIGHT/667.0

/**
 沙盒文件夹地址
 */
#define kPathTemporary       NSTemporaryDirectory()
#define kPathDocument   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)  firstObject]
#define kPathCache      [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject]

/**
 自定义NSLog
 */
#ifdef DEBUG
#define SCLog(...) NSLog(@"%s 第%d行 \n %@\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define SCLog(...)
#endif

/**
 设置RGB颜色
 */
#define SCRGBColor(r,g,b)       [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define SCRGBAColor(r,g,b,a)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define SCRandomColor           [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

/**
 弱引用、强引用
 */
#define SCWeakSelf(type)    __weak typeof(type) weak##type = type;
#define SCStrongSelf(type)  __strong typeof(type) strong##self = type;

/**
 获取系统版本
 */
#define kSystemVersion [UIDevice currentDevice].systemVersion.doubleValue

/**
 获取APP版本号
 */
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/**
 获取当前语言
 */
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

/**
 判断字符串是否为空
 */
#define SCStrIsEmpty(str) ((str == nil) || ([str isEqualToString:@""]) || (str == NULL) || ([str isKindOfClass:[NSNull class]]))


/**
 判断当前屏幕是否是竖屏
 */
#define IsPortrait ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown)

/**
 获取一段持续时间
 */
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime   SCLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)


#endif /* SCCommonMacros_h */
