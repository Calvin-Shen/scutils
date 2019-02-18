//
//  SCUtility+String.m
//  libscutils
//
//  Created by 沈宸 on 2019/1/7.
//  Copyright © 2019 沈宸. All rights reserved.
//

#import "SCUtility+String.h"

@implementation SCUtility (String)
- (CGFloat)sc_calculateStringWidth:(NSString *)string withFont:(UIFont *)font{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGFloat width = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attrs context:nil].size.width;
    return width;
}
@end
