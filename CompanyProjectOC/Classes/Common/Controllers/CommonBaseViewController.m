//
//  CommonBaseViewController.m
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/17.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "CommonBaseViewController.h"

@interface CommonBaseViewController ()

@end

@implementation CommonBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  setupCommonBase];
    [self  initConfigCommonBase];
}

#pragma mark - 基类控制器初始化
- (void)setupCommonBase {
    
}

#pragma mark - 基类控制器配置
- (void)initConfigCommonBase {
    self.view.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}


@end
