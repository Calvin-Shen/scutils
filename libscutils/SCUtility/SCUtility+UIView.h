//
//  SCUtility+UIView.h
//  libscutils
//
//  Created by 沈宸 on 2018/12/7.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCUtility (UIView)
/**
 隐藏导航栏底部的黑线

 @param naviBar 指定的NavigationBar
 */
- (void)sc_hideHairLineOfNavigationBar:(UINavigationBar *)naviBar;

/**
 返回一个view所在的控制器
 
 @param view 需要检测的视图
 */
- (UIViewController *)sc_viewControllerOfView:(UIView *)view;

/**
 设置h状态栏的颜色

 @param color 需要给状态栏设置的颜色
 */
- (void)sc_setStatusBarBackgroundColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
