//
//  ForgotVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/8.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "ForgotVC.h"
#import "ForgotMainView.h"
#import "ForgotNextVC.h"
@interface ForgotVC ()
@property(nonatomic,strong)ForgotMainView * mainView;
@end

@implementation ForgotVC

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
        [weakSelf mainViewSenderWithButton:button];
    };
}

#pragma mark - mainViewButtonSender
- (void)mainViewSenderWithButton:(UIButton *)button {
    ForgotNextVC * vc = [[ForgotNextVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 懒加载视图
- (ForgotMainView *)mainView {
    if (!_mainView) {
        _mainView = [[ForgotMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT)];
    }
    return _mainView;
}

@end
