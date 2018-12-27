//
//  UIAlertController+TapGestureAlertController.m
//  ZaoYin
//
//  Created by 沈宸 on 2018/10/24.
//  Copyright © 2018 Kunsound. All rights reserved.
//

#import "UIAlertController+TapGestureAlertController.h"

@implementation UIAlertController (TapGestureAlertController)
- (void)sc_addCancelTapGesture{
    NSArray * array = [UIApplication sharedApplication].keyWindow.subviews;
    if (array.count>0) {
        // 查找第1个元素位置，即为灰色背景，对其添加点击事件
        UIView * backView = [array lastObject];
        backView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [backView addGestureRecognizer:tap];
    }
}


-(void)tap{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
