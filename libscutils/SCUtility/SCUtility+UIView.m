//
//  SCUtility+UIView.m
//  libscutils
//
//  Created by 沈宸 on 2018/12/7.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "SCUtility+UIView.h"

@implementation SCUtility (UIView)
- (void)sc_hideHairLineOfNavigationBar:(UINavigationBar *)naviBar
{
    naviBar.shadowImage = [UIImage new];
}

- (UIViewController *)sc_viewControllerOfView:(UIView *)view
{
    UIViewController *viewController = nil;
    UIResponder *     next           = view.nextResponder;
    while (next)
    {
        if ([next isKindOfClass:[UIViewController class]])
        {
            viewController = (UIViewController *)next;
            break;
        }
        next = next.nextResponder;
    }
    return viewController;
}

- (void)sc_setStatusBarBackgroundColor:(UIColor *)color
{
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];

    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)])
    {
        statusBar.backgroundColor = color;
    }
}
@end
