//
//  AddAddressVC.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/1.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "AddAddressVC.h"
#import "AddAddressMainView.h"
@interface AddAddressVC ()

@property(nonatomic,strong)AddAddressMainView * mainView;
@end

@implementation AddAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initConfig];
}

- (void)setup {
    [self.view addSubview:self.mainView];
    
}

- (void)initConfig {
    self.mainView.backgroundColor = [UIColor orangeColor];
}

#pragma mark - 初始化视图
- (AddAddressMainView *)mainView {
    if (!_mainView) {
        _mainView = [[AddAddressMainView alloc]initWithFrame:CGRectMake(0, STATUS_NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUS_NAVIGATION_BAR_HEIGHT)];
    }
    return _mainView;
}

@end
