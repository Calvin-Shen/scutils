//
//  UINavigationController+BackButtonHandler.h
//  libscutils
//
//  Created by 沈宸 on 2019/1/3.
//  Copyright © 2019 沈宸. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 自定义NavigationBar的backButtonImage，并且设置title为空，点击返回按钮如果需要执行其他操作，需要在ViewController里面自定义实现- (void)viewControllerShouldPopUpOnNavigationItem:(UINavigationItem *)item方法;
*/
@interface UINavigationController (BackButtonHandler)

@end

NS_ASSUME_NONNULL_END
