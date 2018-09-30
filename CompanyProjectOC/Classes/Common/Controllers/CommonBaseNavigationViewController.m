//
//  CommonBaseNavigationViewController.m
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/17.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "CommonBaseNavigationViewController.h"

@interface CommonBaseNavigationViewController ()

@end

@implementation CommonBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  setupCommonBase];
    [self  initConfigCommonBase];
}

- (void)setupCommonBase {
    
}

- (void)initConfigCommonBase {
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 重写系统Push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
