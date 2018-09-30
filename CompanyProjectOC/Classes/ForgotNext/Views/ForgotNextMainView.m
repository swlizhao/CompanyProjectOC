//
//  ForgotNextMainView.m
//  CompanyProjectOC
//
//  Created by quanqiuwa on 2018/7/24.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "ForgotNextMainView.h"

@implementation ForgotNextMainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self initConfig];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.pwdView];
    [self addSubview:self.nextPwdView];
    [self addSubview:self.commitBtn];
    [self setNeedsUpdateConstraints];
}

- (void)initConfig {
    self.pwdView.textField.placeholder = @"请输入密码";
    self.nextPwdView.textField.placeholder = @"请确认密码";
    
    self.commitBtn.backgroundColor              = [UIColor orangeColor];
    self.commitBtn.layer.cornerRadius           = 22;
    self.commitBtn.titleLabel.font              = [UIFont systemFontOfSize:FONTSIZE_16];
    [self.commitBtn setTitle:@"重置" forState:0];
    [self.commitBtn addTarget:self action:@selector(commitBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

#pragma mark - 提交事件
- (void)commitBtnAction:(UIButton *)button {
    if (self.commonBaseViewButtonActionBlock) {
        self.commonBaseViewButtonActionBlock(button);
    }
}

#pragma mark - 懒加载视图
- (LoginChildView *)pwdView {
    if (!_pwdView) {
        _pwdView = [[LoginChildView alloc]init];
    }
    return _pwdView;
}

- (LoginChildView *)nextPwdView {
    if (!_nextPwdView) {
        _nextPwdView = [[LoginChildView alloc]init];
    }
    return _nextPwdView;
}

- (CommonBaseButton *)commitBtn {
    if (!_commitBtn) {
        _commitBtn = [CommonBaseButton buttonWithType:0];
    }
    return _commitBtn;
}

- (void)updateConstraints {
    [super updateConstraints];
    [_pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(50);
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);
        make.height.equalTo(@44);
    }];
    [_nextPwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdView.mas_bottom).offset(30);
        make.left.equalTo(self.pwdView.mas_left).offset(0);
        make.right.equalTo(self.pwdView.mas_right).offset(0);
        make.height.equalTo(self.pwdView.mas_height);
    }];
    [_commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nextPwdView.mas_bottom).offset(30);
        make.left.equalTo(self).offset(30);
        make.right.equalTo(self).offset(-30);
        make.height.equalTo(@44);
    }];
}

@end
