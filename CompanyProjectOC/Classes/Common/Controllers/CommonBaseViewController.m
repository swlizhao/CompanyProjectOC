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
    [self.view addSubview:self.navBar];
//    self.navBar.backgroundColor = [UIColor redColor];
//
//    self.navigationController.navigationBarHidden = YES;
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


#pragma mark - 懒加载

/**
 * 自定义导航栏
 *
 **/
- (CustomNavigationBar *)navBar {
    if (!_navBar) {
        _navBar = [[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,STATUS_NAVIGATION_BAR_HEIGHT )];
    }
    return _navBar;
}


@end
