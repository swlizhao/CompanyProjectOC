//
//  PersonalHeadView.m
//  CompanyProjectOC
//
//  Created by apple on 2018/3/2.
//  Copyright © 2018年 LIZHAO. All rights reserved.
//

#import "PersonalHeadView.h"

@implementation PersonalHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self initConfig];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.loginBtn];
    [self setNeedsUpdateConstraints];
}

- (void)initConfig {
    self.loginBtn.backgroundColor = RGB(218,165,32);
    [self.loginBtn setTitle:@"登录" forState:0];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:FONTSIZE_15];
}

- (void)loginBtn:(UIButton *)button {
    if (self.baseViewBtnSenderBlcok) {
        self.baseViewBtnSenderBlcok(button);
    }
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:0];
        [_loginBtn addTarget:self action:@selector(loginBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (void)updateConstraints {
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    
    [super updateConstraints];
}

@end
