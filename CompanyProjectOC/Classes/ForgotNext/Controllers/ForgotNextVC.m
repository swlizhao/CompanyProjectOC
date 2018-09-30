//
//  ForgotNextVC.m
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/24.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "ForgotNextVC.h"
#import "ForgotNextMainView.h"
#import "LoginVC.h"
@interface ForgotNextVC ()
@property(nonatomic,strong)ForgotNextMainView * mainView;
@end

@implementation ForgotNextVC

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
    self.navigationItem.title = @"重置密码";
    self.mainView.commonBaseViewButtonActionBlock = ^(UIButton *button) {
        [weakSelf mainViewCommitSenderWithButton:button];
    };
}

#pragma mark - 提交事件
- (void)mainViewCommitSenderWithButton:(UIButton *)button {
    for (UIViewController * vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:NSClassFromString(@"LoginVC")]) {
           [self.navigationController popToViewController:vc animated:YES];
        }
    }
}

#pragma mark - 懒加载视图
- (ForgotNextMainView *)mainView {
    if (!_mainView) {
        _mainView = [[ForgotNextMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _mainView;
}


@end
