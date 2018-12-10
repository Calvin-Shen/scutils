//
//  UITextField+PlaceHolder.h
//  libscutils
//
//  Created by 沈宸 on 2018/12/10.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (PlaceHolder)
/**
 修改placeholder的字体颜色和大小

 @param color placeholder的字体颜色
 @param size placeholder的字体大小
 */
- (void)sc_setPlaceHolderFontColor:(UIColor *)color fontSize:(float)size;
@end

NS_ASSUME_NONNULL_END
