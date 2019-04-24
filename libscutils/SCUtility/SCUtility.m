//
//  SCUtility.m
//  libscutils
//
//  Created by 沈宸 on 2018/12/6.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "SCUtility.h"

static SCUtility *__utility = nil;

@implementation SCUtility
+ (void)initialize
{
    [self sharedInstance];
}

// 重写alloc方法，保证单例
+ (instancetype)alloc
{
    if (__utility)
    {
        return __utility;
    }
    return [super alloc];
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      __utility = [[self alloc] init];
    });
    return __utility;
}

- (UIImage *)sc_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void)sc_resetUserDefaults
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

- (void)sc_goToAppStoreScoreWithId:(NSString *)idString
{
    NSString *urlString = [@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" stringByAppendingString:idString];
    NSURL *   url       = [NSURL URLWithString:urlString];
    if (kSystemVersion >= 10.0)
    {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
    else
    {
        [[UIApplication sharedApplication] openURL:url];
    }
}
@end
