//
//  SCUtility+Animation.m
//  libscutils
//
//  Created by 沈宸 on 2018/12/10.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "SCUtility+Animation.h"

@implementation SCUtility (Animation)
- (void)sc_pauseLayer:(CALayer *)layer{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() toLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

- (void)sc_resumeLayer:(CALayer *)layer{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() toLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}
@end
