//
//  NSString+MD5.m
//  libscutils
//
//  Created by 沈宸 on 2019/2/27.
//  Copyright © 2019 沈宸. All rights reserved.
//

#import "NSString+MD5.h"
#include <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)
- (NSString *)md5HashToLower32Bit
{
    const char *input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];

    CC_MD5(input, (CC_LONG)strlen(input), result);

    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
    {
        printf("%c\n", result[i]);
        [digest appendFormat:@"%02x", result[i]];
    }

    return digest;
}

- (NSString *)md5HashToUpper32Bit
{
    const char *input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);

    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
    {
        [digest appendFormat:@"%02X", result[i]];
    }

    return digest;
}

- (NSString *)md5HashToLower16Bit
{
    NSString *md5Str = [self md5HashToLower32Bit];
    assert(md5Str.length == 32);
    return [md5Str substringWithRange:NSMakeRange(8, 16)];
}

- (NSString *)md5HashToUpper16Bit
{
    NSString *md5Str = [self md5HashToUpper32Bit];
    assert(md5Str.length == 32);
    return [md5Str substringWithRange:NSMakeRange(8, 16)];
}
@end

@implementation NSString (CalculateSize)

- (CGSize)sc_calculateWidthWithFont:(UIFont *)font
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize        size  = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attrs context:nil].size;
    return size;
}

@end

