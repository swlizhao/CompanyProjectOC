//
//  RegisterVC.m
//  CompanyProjectOC
//
//  Created by apple on 2017/10/8.
//  Copyright © 2017年 LIZHAO. All rights reserved.
//

#import "RegisterVC.h"
#import "RegisterMainView.h"
#import "RegisterNextVC.h"
@interface RegisterVC ()
@property(nonatomic,strong)RegisterMainView *mainView;
@end

@implementation RegisterVC

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
    RegisterNextVC * vc = [[RegisterNextVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 懒加载视图
- (RegisterMainView *)mainView {
    if (!_mainView) {
        _mainView = [[RegisterMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT)];
    }
    return _mainView;
}


@end
