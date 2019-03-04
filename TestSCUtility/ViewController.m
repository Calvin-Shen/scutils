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
    
//    NSString *str = @"Hello World";
//    NSString *mdStr2 = [str md5HashToLower16Bit];
//    NSString *md5Str = [str md5HashToLower32Bit];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    NSDictionary *dic = @{@"Name":@"Calvin", @"Age":@(18)};
    NSDictionary *dic2 = @{@"Name":@"Shen", @"Age":@(20)};
    [array addObject:dic];
    [array addObject:dic2];
    
    NSString *path = [[SCUtility sharedInstance] createRandomFileAtPath:kPathDocument prefix:@"template" fileType:@"plist"];
    [array writeToFile:path atomically:YES];
}

- (void)injected{
    SCLog(@"I have been injected");
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.backgroundColor = SCRGBColor(255, 0 , 0);
    [self.view addSubview:label];
    
    [UIView animateWithDuration:3.0f animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, 300);
    }];
}

- (BOOL)navigationShouldPopOnBackButton{
    return YES;
}

- (void)viewControllerShouldPopUpOnNavigationItem:(UINavigationItem *)item{
    SCLog(@"Hello world");
}
@end
