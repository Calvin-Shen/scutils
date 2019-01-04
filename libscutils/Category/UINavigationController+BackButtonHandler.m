//
//  UINavigationController+BackButtonHandler.m
//  libscutils
//
//  Created by 沈宸 on 2019/1/3.
//  Copyright © 2019 沈宸. All rights reserved.
//

#import "UINavigationController+BackButtonHandler.h"
#import "UIViewController+NavigationBackButtonHandler.h"
#import <objc/runtime.h>

@implementation UINavigationController (BackButtonHandler)

+ (void)load{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    UIImage *image = [UIImage imageNamed:@"navi_exit.png"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [bar setBackIndicatorImage:image];
    [bar setBackIndicatorTransitionMaskImage:image];
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(-200, 0) forBarMetrics:UIBarMetricsDefault];
}

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item{
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    
    if(shouldPop) {
        if ([vc respondsToSelector:@selector(viewControllerShouldPopUpOnNavigationItem:)]) {
            [vc viewControllerShouldPopUpOnNavigationItem:item];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *subview in [navigationBar subviews]) {
            if(0. < subview.alpha && subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
    }
    
    return NO;
}


@end
