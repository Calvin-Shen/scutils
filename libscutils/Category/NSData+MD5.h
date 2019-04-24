//
//  NSData+MD5.h
//  libscutils
//
//  Created by 沈宸 on 2019/4/24.
//  Copyright © 2019 沈宸. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MD5)
/**
 将data转换为小写的32位MD5hash值
 
 @return 32位hash值
 */
- (NSString *)md5HashToLower32Bit;

/**
 将data转换为大写的32位MD5的hash值
 
 @return 32位hash值
 */
- (NSString *)md5HashToUpper32Bit;

/**
 将data转换为小写的16位MD5的hash值
 
 @return 16位hash值
 */
- (NSString *)md5HashToLower16Bit;

/**
 将data转换为大写的16位MD5的hash值
 
 @return 16位hash值
 */
- (NSString *)md5HashToUpper16Bit;
@end

NS_ASSUME_NONNULL_END
