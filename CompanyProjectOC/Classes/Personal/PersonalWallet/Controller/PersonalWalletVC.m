//
//  PersonalWalletVC.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "PersonalWalletVC.h"
#import "PersonalWalletMainView.h"
@interface PersonalWalletVC ()

@property(nonatomic,strong)PersonalWalletMainView * mainView;

@end

@implementation PersonalWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initConfig];
}

- (void)setup {
    [self.view addSubview:self.mainView];
}

- (void)initConfig {
    self.navigationItem.title = @"我的钱包";
    self.mainView.backgroundColor = [UIColor brownColor];
}

#pragma mark - 初始化视图
- (PersonalWalletMainView *)mainView {
    if (!_mainView) {
        _mainView = [[PersonalWalletMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT)];
    }
    return _mainView;
}


@end
