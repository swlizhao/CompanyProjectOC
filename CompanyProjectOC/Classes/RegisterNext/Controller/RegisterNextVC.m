//
//  RegisterNextVC.m
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/24.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "RegisterNextVC.h"
#import "RegisterNextMainView.h"
@interface RegisterNextVC ()
@property(nonatomic,strong)RegisterNextMainView * mainView;
@end

@implementation RegisterNextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  setup];
    [self  initConfig];
}

- (void)setup {
    [self.view addSubview:self.mainView];
}

- (void)initConfig {
    WeakSelf(weakSelf)
    self.navigationItem.title = @"注册账号";
    self.mainView.commonBaseViewButtonActionBlock = ^(UIButton *button) {
        [weakSelf mainViewSenderWithButton:button];
    };
}

#pragma mark - mainViewButtonSender
- (void)mainViewSenderWithButton:(UIButton *)button {
    for (UIViewController * vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:NSClassFromString(@"LoginVC")]) {
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

#pragma mark - 懒加载视图
- (RegisterNextMainView *)mainView {
    if (!_mainView) {
        _mainView = [[RegisterNextMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT)];
    }
    return _mainView;
}

@end
