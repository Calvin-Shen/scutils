//
//  UIViewController+NavigationBackButtonHandler.h
//  libscutils
//
//  Created by 沈宸 on 2019/1/3.
//  Copyright © 2019 沈宸. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BackButtonHandlerProtocol<NSObject>
@optional

/**
 重写此方法，可以让嵌套在NavigationController中的UIViewController的实例在点击BackButton时是否跳转到上一个界面，如果允许跳转YES，如果禁止跳转返回NO

 @return BOOL值代表当前被嵌套在NavigationController中的VC是否可以被pop，可以返回YES，否则返回NO
 */
- (BOOL)navigationShouldPopOnBackButton;


/**
 在点击NavigationBar上的回退按钮，当navigationShouldPopOnBackButton返回为YES时，表示允许返回特定VC，返回前需要执行一些附加操作，比如传值，网络操作，保存等，可以在这个方法中执行r，如果navigationShouldPopOnBackButton返回为NO，则表示不允许返回

 @param item 当前的UINavigationItem
 */
- (void)viewControllerShouldPopUpOnNavigationItem:(UINavigationItem *)item;

@end

@interface UIViewController (NavigationBackButtonHandler)<BackButtonHandlerProtocol>

@end

NS_ASSUME_NONNULL_END
