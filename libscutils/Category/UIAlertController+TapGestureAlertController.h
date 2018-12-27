//
//  UIAlertController+TapGestureAlertController.h
//  ZaoYin
//
//  Created by 沈宸 on 2018/10/24.
//  Copyright © 2018 Kunsound. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIAlertController (TapGestureAlertController)
/**
 使alertController能够点击空白处关闭
 */
- (void)sc_addCancelTapGesture;
@end
