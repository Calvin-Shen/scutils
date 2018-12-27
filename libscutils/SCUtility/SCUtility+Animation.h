//
//  SCUtility+Animation.h
//  libscutils
//
//  Created by 沈宸 on 2018/12/10.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCUtility (Animation)
/**
 暂停某个layer的动画

 @param layer 指定的CALayer对象
 */
- (void)sc_pauseLayer:(CALayer *)layer;

/**
 暂停某个layer中的动画，再继续这个layer里面的动画执行

 @param layer 指定的CALayer对象
 */
- (void)sc_resumeLayer:(CALayer *)layer;
@end

NS_ASSUME_NONNULL_END
