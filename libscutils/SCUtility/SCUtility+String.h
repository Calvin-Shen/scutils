//
//  SCUtility+String.h
//  libscutils
//
//  Created by 沈宸 on 2019/1/7.
//  Copyright © 2019 沈宸. All rights reserved.
//

#import "SCUtility.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCUtility (String)
/**
 根据传入的字符串和该字符串的字体计算，字符串的宽度

 @param string 需要计算的的字符串
 @param font 该字符串的字体
 @return 该字符串的宽度
 */
- (CGFloat)sc_calculateStringWidth:(NSString *)string
                          withFont:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
