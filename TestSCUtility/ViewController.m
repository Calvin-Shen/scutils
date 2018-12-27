//
//  ViewController.m
//  TestSCUtility
//
//  Created by 沈宸 on 2018/12/27.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "ViewController.h"
#import "libscutils.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [SCUtils sc_imageWithColor:SCRGBColor(255, 0, 0)];
    SCLog(@"imageSize:%@",NSStringFromCGSize(image.size));
}


@end
