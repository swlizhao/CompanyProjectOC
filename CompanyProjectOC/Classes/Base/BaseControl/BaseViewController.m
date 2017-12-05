//
//  BaseViewController.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/7.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaseViewControllerSetup];
    [self initBaseViewControllerConfig];
}

- (void)initBaseViewControllerSetup {
    NSLog(@"我是BaseViewController--->ViewDidLoad");
    [self.view addSubview:self.loadingView];
}

- (void)initBaseViewControllerConfig {
    NSLog(@"我是BaseConfig --->ViewDidLoad");
    self.loadingView.backgroundColor = [UIColor whiteColor];
}

- (LoadingView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[LoadingView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _loadingView;
}


@end
