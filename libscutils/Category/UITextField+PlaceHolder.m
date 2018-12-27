//
//  UITextField+PlaceHolder.m
//  libscutils
//
//  Created by 沈宸 on 2018/12/10.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "UITextField+PlaceHolder.h"

@implementation UITextField (PlaceHolder)
- (void)sc_setPlaceHolderFontColor:(UIColor *)color fontSize:(float)size{
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont boldSystemFontOfSize:size] forKeyPath:@"_placeholderLabel.font"];
}
@end
