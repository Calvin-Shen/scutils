//
//  ViewController.m
//  TestSCUtility
//
//  Created by 沈宸 on 2018/12/27.
//  Copyright © 2018 沈宸. All rights reserved.
//

#import "ViewController.h"
#import <libscutils/libscutils.h>

@interface ViewController ()

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSString *str = @"Hello World";
    NSString *mdStr2 = [str md5HashToLower16Bit];
    NSString *md5Str = [str md5HashToLower32Bit];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (BOOL)navigationShouldPopOnBackButton{
    return YES;
}

- (void)viewControllerShouldPopUpOnNavigationItem:(UINavigationItem *)item{
    SCLog(@"Hello world");
}
@end
