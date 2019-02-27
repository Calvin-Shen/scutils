//
//  NSString+MD5.h
//  libscutils
//
//  Created by 沈宸 on 2019/2/27.
//  Copyright © 2019 沈宸. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
    MD5加密是最常用的不可逆加密方法之一，是将字符串通过相应特征生成一段32位的数字字母混合码。对输入信息生成唯一的128位散列值（32个16进制的数字）
*/
NS_ASSUME_NONNULL_BEGIN

@interface NSString (MD5)

/**
 将字符串转换为小写的32位MD5hash值

 @return 32位hash值
 */
- (NSString *)md5HashToLower32Bit;

/**
 将字符串转换为大写的32位MD5hash值
 
 @return 32位hash值
 */
- (NSString *)md5HashToUpper32Bit;

/**
 将字符串转换为小写的16位MD5hash值
 
 @return 16位hash值
 */
- (NSString *)md5HashToLower16Bit;

/**
 将字符串转换为大写的16位MD5hash值
 
 @return 16位hash值
 */
- (NSString *)md5HashToUpper16Bit;
@end

NS_ASSUME_NONNULL_END
